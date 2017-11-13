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
        let filePath = NSHomeDirectory() + "/Documents/test.m4a"
        let url = URL(fileURLWithPath: filePath)
        
        // 再生と録音の機能をアクティブにする
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! session.setActive(true)
        

        let recordSetting = [
            AVFormatIDKey: Int(kAudioFormatAppleLossless),
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
}
