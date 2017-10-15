//
//  HeimusubiUsersModel.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/15.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

struct HeimusubiUsersModel {
    var users: [HeimusubiUserModel] = []
}

struct HeimusubiUserModel {
    let id: Int
    let userName: String
    let email: String
    let status: Int
    let created: Int
    let modified: Int
}
