//
//  Header.swift
//  Dasida
//
//  Created by kimsian on 2021/10/15.
//

import Foundation
import Alamofire

struct Token {
    static var _token: String?
    static var token: String? {
        get  {
            _token = UserDefaults.standard.string(forKey: "token")
            return _token
        }
        set(newToken) {
            UserDefaults.standard.setValue(newToken, forKey: "token")
            _token = UserDefaults.standard.string(forKey: "token")
        }
    }
    
    static var _refreshToken: String?
    static var refreshToken: String? {
        get {
            _refreshToken = UserDefaults.standard.string(forKey: "refreshToken")
            return _refreshToken
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "refreshToken")
            _refreshToken = UserDefaults.standard.string(forKey: "refreshToken")
        }
    }
    
    static func tokenRemove() {
        token = nil
    }
}

enum Header {
    case token, tokenIsEmpty
    
    func header() -> HTTPHeaders {
        guard let token = Token.token else {
            return ["Content-Type" : "application/json"]
        }
        
        switch self {
        case.token:
            return HTTPHeaders(["Authorization" : "Bearer " + token, "Content-Type" : "application/json"])
            
        case .tokenIsEmpty:
            return ["Content-Type" : "application/json"]
        }
    }
    
}
