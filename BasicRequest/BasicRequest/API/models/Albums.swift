//
//  Albums.swift
//  BasicRequest
//
//  Created by SERGEI on 31.07.2022.
//

import Foundation

// MARK: - Album
struct Album: Codable {
    let userID, id: Int?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Albums = [Album]

