//
//  MainViewController.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/16.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit
import CocoaMQTT
import UserNotifications


class MainViewController: UIViewController {
    fileprivate var presenter: MainPresenter!
    fileprivate var mqttc: CocoaMQTT?
    
    @IBOutlet weak var heimuImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(getNowTime), userInfo: nil, repeats: true)
        timer.fire()
        
        let userDefaults = UserDefaults.standard
        let userName = userDefaults.string(forKey: "userName")
        if userName != nil {
            self.userNameLabel.text = userName
        }

        // Do any additional setup after loading the view.
        self.heimuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.heimuImageViewTapped(_:))))
        self.heimuImageView.isUserInteractionEnabled = true
        
        // Get Weather Status
        getWeatherStatus()
        
        // Setting Mqtt and Connect
        mqttSetting()
        mqttc!.connect()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.viewWillEnterForeground),
            name: NSNotification.Name.UIApplicationWillEnterForeground,
            object: nil
        )
        
    }
    
    func inject(presenter: MainPresenter) {
        self.presenter = presenter
    }
    
    @objc func getNowTime() {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "a h:mm"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let timeString = formatter.string(from: now)
        
        self.timeLabel.text = timeString
    }
    
    @objc func viewWillEnterForeground() {
        self.presenter.heimuSignImageViewPressed()
    }
    
    
    func mqttSetting() {
        let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        mqttc = CocoaMQTT(clientID: clientID, host: "m14.cloudmqtt.com", port: 17419)
        mqttc!.username = "hufvczek"
        mqttc!.password = "Jxv8I_AvjN7S"
        mqttc!.willMessage = CocoaMQTTWill(topic: "/voiceStatus", message: "dieout")
        mqttc!.keepAlive = 60
        mqttc!.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @objc func heimuImageViewTapped(_ sender: UITapGestureRecognizer) {
        self.presenter.heimuSignImageViewPressed()
    }
    
    func getWeatherStatus() {
        let postString = "address_id=1"
         
        var request = URLRequest(url: URL(string: "http://heimusubi-server.herokuapp.com/api/weather/get")!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
         
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
             
            if error != nil {
                print(error)
                return
            }
             
            print("response: \(response!)")
             
            let phpOutput = String(data: data!, encoding: .utf8)!
            print("php output: \(phpOutput)")
        })
        task.resume()
    }
    
}


extension MainViewController: CocoaMQTTDelegate {
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        print("Successfully Received Ack Message")
        if ack == .accept {
            mqtt.subscribe("voice/status", qos: CocoaMQTTQOS.qos0)
        }
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16 ) {
        print("Successfully Received Message: \(message.string ?? "")")
        
        let trigger: UNNotificationTrigger
        let content = UNMutableNotificationContent()
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        content.title = "ただいまのお知らせ"
        content.body = "まちこの家に住人が帰ってきました"
        content.sound = UNNotificationSound.default()
        
        // 通知スタイルを指定
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
        // 通知をセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: String) {
        print("Successfully Subscribed Topic: \(topic)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        print("Successfully Did Unsubscribed Topic: \(topic)")
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT){}
    func mqttDidReceivePong(_ mqtt: CocoaMQTT){}
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?){}
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {}
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {}
}
