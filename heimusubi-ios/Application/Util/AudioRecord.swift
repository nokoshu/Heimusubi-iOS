//
//  AudioRecord.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/11/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation
import AVFoundation

class AudioRecord {
    fileprivate var audioRecorder: AVAudioRecorder?
    
    init() {
        let filePath = NSHomeDirectory() + "/Documents/test2.caf"
        let url = URL(fileURLWithPath: filePath)
        
        // 再生と録音の機能をアクティブにする
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! session.setActive(true)
        

        let recordSetting = [
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderBitRateKey: 16,
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue
        ]
        
        

        do {
            self.audioRecorder = try AVAudioRecorder(url: url, settings: recordSetting)
        } catch {
            
        }
    }
    
    func start() {
        print("録音します")
        self.audioRecorder!.record()
    }
    
    func stop() {
        print("録音しました")
        self.audioRecorder!.stop()
    }
    
    
    func upload()
    {
        
        let myUrl:URL = URL(string: "http://design.prodrb.com/heimu.php")!

        do {
            let fileurldata = try Data(contentsOf: self.audioRecorder!.url)
            
            let request = NSMutableURLRequest(url: myUrl)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            let base64String = fileurldata.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
            
            var _: NSError? = nil
            let params = ["sound":[ "content_type": "audio/aac", "filename":"file", "file_data": base64String]]

            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions(rawValue: 0))
            
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error -> Void in
                _ = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                var _: NSError?
                print("送信したよ")
                // process the response
            })
            
            task.resume() // this is needed to start the task
        } catch {
            print(error.localizedDescription)
        }
        

    }
}
