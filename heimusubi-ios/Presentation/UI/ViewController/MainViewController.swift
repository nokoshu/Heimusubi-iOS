//
//  MainViewController.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/16.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit
import CocoaMQTT

class MainViewController: UIViewController {
    fileprivate var presenter: MainPresenter!
    fileprivate var mqttc: CocoaMQTT?
    
    @IBOutlet weak var heimuImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.heimuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.heimuImageViewTapped(_:))))
        self.heimuImageView.isUserInteractionEnabled = true
        
        // Setting Mqtt and Connect
        mqttSetting()
        mqttc!.connect()
    }
    
    func inject(presenter: MainPresenter) {
        self.presenter = presenter
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
