//
//  SubMainViewController.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/11/15.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit
import CocoaMQTT
import UserNotifications



class SubMainViewController: UIViewController {
    fileprivate var presenter: SubMainPresenter!
    fileprivate var mqttc: CocoaMQTT?
    fileprivate var weatherId: String?

    
    @IBOutlet weak var heimuImageView: UIImageView!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weatherStatusImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(getNowTime), userInfo: nil, repeats: true)
        timer.fire()
        
        let userDefaults = UserDefaults.standard
        let userName = userDefaults.string(forKey: "userName")
        if userName != nil {
            if userName == "みちこの家" {
                self.userNameLabel.text = "実家"
                self.weatherId = "222"
            } else {
                self.userNameLabel.text = "みちこの家"
                self.weatherId = "129"
            }
        }
        
        // Do any additional setup after loading the view.
        self.heimuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.heimuImageViewTapped(_:))))
        self.heimuImageView.isUserInteractionEnabled = true
        
        getWeatherStatus()
        
        mqttSetting()
        mqttc!.connect()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.changeStatus),
            name: NSNotification.Name.UIApplicationWillEnterForeground,
            object: nil
        )
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
    
    func mqttSetting() {
        let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        mqttc = CocoaMQTT(clientID: clientID, host: "m14.cloudmqtt.com", port: 17419)
        mqttc!.username = "hufvczek"
        mqttc!.password = "Jxv8I_AvjN7S"
        mqttc!.willMessage = CocoaMQTTWill(topic: "/voiceStatus", message: "dieout")
        mqttc!.keepAlive = 60
        mqttc!.delegate = self
    }
    
    func inject(presenter: SubMainPresenter) {
        self.presenter = presenter
    }

    @objc func changeStatus() {
        let userDefaults = UserDefaults.standard
        let status = userDefaults.string(forKey: "status")
        if (status == "1") {
            let image: UIImage! = UIImage(named: "health_happy")
            self.statusImageView.image = image
        } else {
            let image: UIImage! = UIImage(named: "health_unhappy")
            self.statusImageView.image = image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func heimuImageViewTapped(_ sender: UITapGestureRecognizer) {
        self.presenter.heimuSignImageViewPressed()
    }
    

}

extension SubMainViewController: CocoaMQTTDelegate {
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        print("Successfully Received Ack Message")
        if ack == .accept {
            mqtt.subscribe("voice/status", qos: CocoaMQTTQOS.qos0)
            mqtt.subscribe("occupied/status", qos: CocoaMQTTQOS.qos0)

        }
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16 ) {
        print("Successfully Received Message: \(message.string ?? "")")
        
        let data = message.string!
        
        if (data.contains("_") == true) {
            let split = data.components(separatedBy: "_")
            let name = split[0]
            let status = split[1]
            
            let userDefaults = UserDefaults.standard
            let userName = userDefaults.string(forKey: "userName")
            print(userName)
            if (userName == "みちこの家" && name == "mother") {
                if status == "1" {
                    self.heimuImageView.image = UIImage(named: "heimu_occupied")
                } else {
                    self.heimuImageView.image = UIImage(named: "heimu_vacant")
                }
            } else if (userName == "実家" && name == "child") {
                if status == "1" {
                    self.heimuImageView.image = UIImage(named: "heimu_occupied")
                } else {
                    self.heimuImageView.image = UIImage(named: "heimu_vacant")
                }
            }
            


        } else {
            
            let userDefaults = UserDefaults.standard
            userDefaults.set(message.string, forKey: "status")
            userDefaults.synchronize()
            
            self.changeStatus()
            
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
    
    func getWeatherStatus() {
        let postString = "address_id=" + weatherId!
        
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
            
            let newWeatherStatus = String(data: data!, encoding: .utf8)!
            if newWeatherStatus == "0" {
                self.weatherStatusImageView.image = UIImage(named: "weather_sunny")
            } else if newWeatherStatus == "1" {
                self.weatherStatusImageView.image = UIImage(named: "weahter_cloudy")
            } else {
                self.weatherStatusImageView.image = UIImage(named: "weather_rainy")
            }
        })
        task.resume()
    }
}
