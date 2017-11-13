//
//  SigninPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol MainPresenter {
    func heimuSignImageViewPressed()
}

class MainPresenterImplementation: MainPresenter {
    fileprivate let useCase: MainUseCase!
    fileprivate let wireframe: MainWireframe!
    
    init(useCase: MainUseCase, wireframe: MainWireframe) {
        self.useCase    = useCase
        self.wireframe  = wireframe
    }
    
    func heimuSignImageViewPressed() {
        self.wireframe.showRecordPopupView()
//        print("音声クラスをセットアップします")
//        let audioSource: AudioRecord = AudioRecord()
//        audioSource.start()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            audioSource.stop()
//        }
    }


}
