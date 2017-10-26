//
//  RegisterHeimuPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol RegisterHeimuPresenter {
    func searchHeimuButtonPressed()
    func heimuSignImageViewPressed()
}

class RegisterHeimuPresenterImplementation: RegisterHeimuPresenter {
    fileprivate var useCase: RegisterHeimuUseCase!
    fileprivate let wireframe: RegisterHeimuWireframe!
    
    init(wireframe: RegisterHeimuWireframe, useCase: RegisterHeimuUseCase) {
        self.wireframe = wireframe
        self.useCase = useCase
    }
    
    func searchHeimuButtonPressed() {
        self.useCase.starScanPeripheral()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.useCase.stopScanPeripheral()
            let scannedPeripherals = self.useCase.getScannedPeripherals()
            
            print("                            ")
            print("------------------検出されたBluetoothデバイス一覧-------------------")
            for (index, element) in scannedPeripherals.enumerated() {
                print("No: \(index + 1)")
                if element.name == "BlueZ 5.47" {
                    print("デバイスの名前: 竹之下遼 の Raspberry Pi")
                } else {
                    print("デバイスの名前: \(element.name!)")
                }
                print("デバイスのUUID: \(element.identifier)")
            }
        }
    }
    
    func heimuSignImageViewPressed() {
        self.wireframe.showBootHeimuView()
    }
    
}
