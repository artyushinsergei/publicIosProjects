//
//  Posts.swift
//  BasicRequest
//
//  Created by SERGEI on 31.07.2022.
//

import Foundation

struct Post: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Posts = [Post]
