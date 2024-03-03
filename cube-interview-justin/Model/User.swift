//
//  User.swift
//  cube-interview-justin
//
//  Created by 曾柏楊 on 2024/2/24.
//

import Foundation

struct UserModel: Codable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "response"
    }
}

struct User: Codable {
    let name: String
    let kokoid: String
}
