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
                // Signin
                case .Signin:
                    path.append("/signin")
                
                // Signup
                case .Signup:
                    path.append("/signup")
                }
                
                return path
            }
            
            var parameters: Parameters {
                var params: Parameters = [:]
                
                switch self {
                // Signin
                case let .Signin(email, plainTextPassword):
                    params["email"] = email
                    params["plain_text_password"] = plainTextPassword
                    
                // Signup
                case let .Signup(userName, email, plainTextPassword):
                    params["user_name"] = userName
                    params["email"]     = email
                    params["plain_text_password"] = plainTextPassword
                }
                
                return params
            }
            
            case Signin(email: String, plainTextPassword: String)
            case Signup(userName: String, email: String, plainTextPassword: String)
        }
        
        enum Heimu: Routable {
            static let path = Router.host + "/heimu"

            var urlString: String {
                var path = Heimu.path
                
                switch self {
                // Register
                case .Register:
                    path.append("/register")
                }
                
                return path
            }
            
            var parameters: Parameters {
                var params: Parameters = [:]
                
                switch self {
                // Register
                case let .Register(heimuName, address):
                    params["heimu_name"]  = heimuName
                    params["address"]     = address
                }
                
                return params
            }
            
            case Register(heimuName: String, address: String)
        }
        
        enum Address: Routable {
            static let path = Router.host + "/weather"
            
            var urlString: String {
                var path = Address.path
                
                switch self  {
                case .Get:
                    path.append("/get")
                }
                
                return path
            }
            
            var parameters: Parameters {
                var params: Parameters = [:]
                
                switch self {
                case let .Get(addressId):
                    params["address_id"] = addressId
                }
                
                return params
            }
            
            case Get(addressId: Int)
        }
    }
}


extension HeimusubiAPIClient {
    typealias SigninCompletionHandler = (Result<HeimusubiUserEntity>) -> Void
    typealias SignupCompletionHandler = (Result<HeimusubiUserEntity>) -> Void
    typealias RegisterHeimuCompletionHandler = (Result<HeimusubiHeimuEntity>)  -> Void
    typealias GetWeatherStatusCompletionHandler = (Result<HeimusubiAddressEntity>) -> Void

    class func signin(email: String,
                      plainTextPassword: String,
                      completionHandler: SigninCompletionHandler? = nil) {
        let router = HeimusubiAPIClient.Router.Auth.Signin(email: email, plainTextPassword: plainTextPassword)
        let urlString = router.urlString
        let parameters = router.parameters
        
        HeimusubiAPIClient.request(url: urlString, method: .post, parameters: parameters, completionHandler: completionHandler)
    }
    
    class func signup(userName: String,
                      email: String,
                      plainTextPassword: String,
                      completionHandler: SignupCompletionHandler? = nil) {
        let router = HeimusubiAPIClient.Router.Auth.Signup(userName: userName, email: email, plainTextPassword: plainTextPassword)
        let urlString = router.urlString
        let parameters = router.parameters
        
        HeimusubiAPIClient.request(url: urlString, method: .post, parameters: parameters, completionHandler: completionHandler)
    }
    
    class func registerHeimu(heimuName: String,
                             address: String,
                             completionHandler: RegisterHeimuCompletionHandler? = nil) {
        let router = HeimusubiAPIClient.Router.Heimu.Register(heimuName: heimuName, address: address)
        let urlString = router.urlString
        let parameters = router.parameters
        
        HeimusubiAPIClient.request(url: urlString, method: .post, parameters: parameters, completionHandler: completionHandler)
    }
    
    class func getWeatherStatus(addressId: Int, completionHandler: GetWeatherStatusCompletionHandler? = nil) {
        let router = HeimusubiAPIClient.Router.Address.Get(addressId: addressId)
        let urlString = router.urlString
        let parameters = router.parameters
        
        HeimusubiAPIClient.request(url: urlString, method: .post, parameters: parameters, completionHandler: completionHandler)
    }
                      
}
