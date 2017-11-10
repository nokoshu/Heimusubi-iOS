//
//  RegisterHeimuPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol DetectHeimuPresenter {
    func searchHeimu()
    func tappedTableViewCell()
}

protocol DetectHeimuPresenterInput {
    func setPeripheralList(peripheralList: Array<String>)
}

class DetectHeimuPresenterImplementation: DetectHeimuPresenter {
    fileprivate let useCase: DetectHeimuUseCase!
    fileprivate let wireframe: DetectHeimuWireframe!
    fileprivate var viewController: DetectHeimuPresenterInput!

    
    
    init(wireframe: DetectHeimuWireframe, useCase: DetectHeimuUseCase) {
        self.wireframe  = wireframe
        self.useCase    = useCase
    }
    
    func inject(viewController: DetectHeimuPresenterInput) {
        self.viewController = viewController
    }
    
    
    func searchHeimu() {
        // Searching Bluetooth is activated automatically.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.useCase.stopScanPeripheral()
            let scannedPeripherals = self.useCase.getScannedPeripherals()
            var list: [String] = []
            for (index, element) in scannedPeripherals.enumerated() {
                if let name = element.name {
                    list.append(name)
                }
            }
            
            self.viewController.setPeripheralList(peripheralList: list)
        }
    }
    
    func tappedTableViewCell() {
        self.wireframe.showConnectHeimuView()
    }
    
}
