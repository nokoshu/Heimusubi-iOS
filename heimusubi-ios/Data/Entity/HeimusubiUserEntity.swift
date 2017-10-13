//
//  HeimusubiEntity.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

import ObjectMapper

struct HeimusubiUsersEntity: Mappable {
    var items: [HeimusubiUserEntiry] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.items <- map["items"]
    }
}

struct HeimusubiUserEntiry: Mappable {
    var id              = 0
    var user_name       = ""
    var email           = ""
    var password        = ""
    var created         = 0
    var modified        = 0
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.id                 <- map["id"]
        self.user_name          <- map["user_name"]
        self.email              <- map["email"]
        self.password           <- map["password"]
        self.created            <- map["created"]
        self.modified           <- map["modified"]
    }
}
