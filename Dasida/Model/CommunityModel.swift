//
//  CommunityModel.swift
//  Dasida
//
//  Created by kimsian on 2021/11/11.
//

import Foundation

struct CommunityModel : Codable {
    var name = String()
    var id_pk = Int()
    var title = String()
    var content = String()
    
    init(name: String, id_pk: Int, title: String, content: String) {
        self.name = name
        self.id_pk = id_pk
        self.title = title
        self.content = content
    }
}

struct posts: Codable {
    var posts = [CommunityModel]()
}
