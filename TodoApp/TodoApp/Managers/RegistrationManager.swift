//
//  RegistrationManager.swift
//  TodoApp
//
//  Created by David Winnicki on 2017-06-22.
//  Copyright © 2017 Fatih Nayebi. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import ObjectMapper

class RegisterResponse: Mappable {
    
    var success: String = "false"
    var message: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
    }
}

class RegistrationManager {
    class func register(userName: String,
                     password: String,
                     _ completion: @escaping (_ responseData: RegisterResponse?, _ error: Bool?) -> ()) {
        
        let url = URL(string: "http://localhost:8080/register")!
        
        let headers: HTTPHeaders = [
            "userName": userName,
            "password": password
        ]
        
        WebServiceManger.sendRequest(requestHeaders: headers,
                                     url: url,
                                     requestMethod: .post,
                                     responseType: RegisterResponse.self) {
            (responseData: RegisterResponse?, error: Bool?) in
            completion(responseData, error)
        }
    }
}
