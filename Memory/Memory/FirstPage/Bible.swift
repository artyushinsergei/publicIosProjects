//
//  People.swift
//  Memory
//
//  Created by SERGEI on 13.12.2022.
//

import Foundation


// MARK: - Bible
struct Bible: Codable {
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let id, dblID, abbreviation, abbreviationLocal: String?
    let language: Language?
    let countries: [Country]?
    let name, nameLocal, datumDescription, descriptionLocal: String?
    let relatedDbl, type, updatedAt: String?
    let audioBibles: [AudioBible]?

    enum CodingKeys: String, CodingKey {
        case id
        case dblID = "dblId"
        case abbreviation, abbreviationLocal, language, countries, name, nameLocal
        case datumDescription = "description"
        case descriptionLocal, relatedDbl, type, updatedAt, audioBibles
    }
}

// MARK: - AudioBible
struct AudioBible: Codable {
    let id, name, nameLocal, audioBibleDescription: String?
    let descriptionLocal: String?

    enum CodingKeys: String, CodingKey {
        case id, name, nameLocal
        case audioBibleDescription = "description"
        case descriptionLocal
    }
}

// MARK: - Country
struct Country: Codable {
    let id, name, nameLocal: String?
}

// MARK: - Language
struct Language: Codable {
    let id, name, nameLocal, script: String?
    let scriptDirection: String?
}
