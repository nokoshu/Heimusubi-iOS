//
//  RegisterHeimuUseCase.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation
import CoreBluetooth

protocol RegisterHeimuUseCase {
    func seachNearByHeimu() -> Array<CBPeripheral>
}

class RegisterHeimuUseCaseImplementation: NSObject, RegisterHeimuUseCase, CBCentralManagerDelegate {
    fileprivate var centralManager: CBCentralManager!
    fileprivate var scannedPeripherals: [CBPeripheral] = []
    fileprivate var peripheral: CBPeripheral!
    
    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    
    func seachNearByHeimu() -> Array<CBPeripheral> {
        self.centralManager.scanForPeripherals(withServices: nil, options: nil)
        
        return self.scannedPeripherals
    }
    
    /*---------------------------
     * CBCentralManagerDelegate
     *-------------------------*/
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("state: \(central.state)")
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("peripheral: \(peripheral)")
        self.scannedPeripherals.append(peripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("connected!")
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("faild...")
    }
}
