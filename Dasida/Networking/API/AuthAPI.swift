//
//  AuthAPI.swift
//  Dasida
//
//  Created by kimsian on 2021/10/15.
//

import Foundation

enum AuthAPI: API {
    
    case signup, signin
    func path() -> String {
        switch self {
        case .signin:
            return "/login"
        case .signup:
            return "/signup"
        }
    }
    
    
}
