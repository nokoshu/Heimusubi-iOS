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
    func starScanPeripheral()
    func stopScanPeripheral()
    func getScannedPeripherals() -> Array<CBPeripheral>
}

class RegisterHeimuUseCaseImplementation: NSObject, RegisterHeimuUseCase, CBCentralManagerDelegate {
    fileprivate var centralManager: CBCentralManager!
    fileprivate var scannedPeripherals: [CBPeripheral] = []
    fileprivate var peripheral: CBPeripheral!
    
    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func starScanPeripheral() {
        self.centralManager.scanForPeripherals(withServices: nil, options: nil)
    }

    func stopScanPeripheral() {
        self.centralManager.stopScan()
    }
    
    func getScannedPeripherals() -> Array<CBPeripheral> {
        return self.scannedPeripherals
    }
    
    /*---------------------------
     * CBCentralManagerDelegate
     *-------------------------*/
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("state: \(central.state)")
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if self.scannedPeripherals.contains(peripheral) == false {
            self.scannedPeripherals.append(peripheral)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("connected!")
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("faild...")
    }
}
