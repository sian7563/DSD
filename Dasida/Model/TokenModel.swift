//
//  TokenModel.swift
//  Dasida
//
//  Created by kimsian on 2021/10/17.
//

import Foundation

struct TokenModel : Codable {
    var access_token = String()
    var refresh_token = String()
    
    init(access_token : String,  refresh_token : String) {
        self.access_token = access_token
        self.refresh_token = refresh_token
    }
}
