//
//  APIClient.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

import Alamofire
import ObjectMapper

public enum Result<T> {
    case success(T)
    case error(Error)
}

public protocol Routable {
    var urlString: String { get }
    var parameters: Parameters { get }
}

open class APIClient {
    typealias CompletionHundler<T> = (Result<T>) -> Void
    
    class func request<T: Mappable>(url: URLConvertible,
                                    method: Alamofire.HTTPMethod,
                                    parameters: Parameters? = nil,
                                    headers: HTTPHeaders? = nil,
                                    completionHandler: CompletionHundler<T>? = nil) {
        Alamofire.request(url, method: method, parameters: parameters, headers: headers)
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                if let entity = Mapper<T>().map(JSONObject: value) {
                    completionHandler?(Result<T>.success(entity))
                }
            case .failure(let error):
                completionHandler?(Result<T>.error(error))
            }
        }
    }
}
