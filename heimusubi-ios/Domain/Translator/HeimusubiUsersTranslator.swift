//
//  HeimusubiUsersTranslator.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/15.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

final class HeimusubiUsersTranslator: Translator {
    typealias Input = HeimusubiUsersEntity
    typealias Output = HeimusubiUsersModel
    
    static func translate(entry: Input) -> Output {
        let users: [HeimusubiUserModel] = entry.items.map {
            HeimusubiUserTranslator.translate(entry: $0)
        }
        
        return HeimusubiUsersModel(users: users)
    }
}

final class HeimusubiUserTranslator: Translator {
    typealias Input = HeimusubiUserEntity
    typealias Output = HeimusubiUserModel
    
    static func translate(entry: Input) -> Output {
        let id          = entry.id
        let userName    = entry.user_name
        let email       = entry.email
        let status      = entry.status
        let created     = entry.created
        let modified    = entry.modified
        
        return HeimusubiUserModel (id: id,
                                   userName: userName,
                                   email: email,
                                   status: status,
                                   created: created,
                                   modified: modified)
    }
}
