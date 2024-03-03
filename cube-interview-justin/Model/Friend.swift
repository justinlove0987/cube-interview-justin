//
//  Friend.swift
//  cube-interview-justin
//
//  Created by 曾柏楊 on 2024/3/3.
//

import Foundation

struct FriendModel: Codable {
    let friends: [Friend]
    
    enum CodingKeys: String, CodingKey {
        case friends = "response"
    }
}

struct Friend: Codable {
    let name: String
    let status: Int
    let isTop: String
    let fid: String
    let updateDate: String
}

