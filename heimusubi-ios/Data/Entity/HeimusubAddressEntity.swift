//
//  HeimusubiEntity.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

import ObjectMapper

struct HeimusubiAddressesEntity: Mappable {
    var items: [HeimusubiHeimuEntity] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.items <- map["items"]
    }
}

struct HeimusubiAddressEntity: Mappable {
//    var id                  = 0
//    var heimu_name          = ""
//    var related_heimu_ids   = ""
//    var belong_use_ids      = ""
//    var address_id          = 0
//    var is_sleep            = 0
//    var serial_number       = 0
//    var created             = 0
//    var modified            = 0
    var weather_status = 0
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
//        self.id                  <- map["id"]
//        self.heimu_name          <- map["heimu_name"]
//        self.related_heimu_ids   <- map["related_heimu_ids"]
//        self.belong_use_ids      <- map["password"]
//        self.address_id          <- map["status"]
//        self.created             <- map["created"]
//        self.modified            <- map["modified"]
        self.weather_status     <- map["weather_status"]
    }
}
