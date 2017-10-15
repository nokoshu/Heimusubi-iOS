//
//  HeimusubiAPIClient.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

import Alamofire

final class HeimusubiAPIClient: APIClient {
    
    // Root
    enum Router: Routable {
        static let host = "https://heimusubi-server.herokuapp.com/api"
        
        var urlString: String {
            return ""
        }
        
        var parameters: Parameters {
            return [:]
        }
        
        // Auth
        enum Auth: Routable {
            static let path = Router.host + "/auth"
            
            var urlString: String {
                var path = Auth.path
                
                switch self {
                case .Signin:
                    path.append("/signin")
                }
                
                return path
            }
            
            var parameters: Parameters {
                var params: Parameters = [:]
                
                switch self {
                case let .Signin(email, plainTextPassword):
                    params["email"] = email
                    params["plain_text_password"] = plainTextPassword
                }
                
                return params
            }
            
            case Signin(email: String, plainTextPassword: String)
        }
    }
}


extension HeimusubiAPIClient {
    typealias SigninCompletionHandler = (Result<HeimusubiUserEntity>) -> Void
    
    class func signin(email: String,
                      plainTextPassword: String,
                      completionHandler: SigninCompletionHandler? = nil) {
        let router = HeimusubiAPIClient.Router.Auth.Signin(email: email, plainTextPassword: plainTextPassword)
        let urlString = router.urlString
        let parameters = router.parameters
        
        HeimusubiAPIClient.request(url: urlString, method: .post, parameters: parameters, completionHandler: completionHandler)
    }
                      
}
