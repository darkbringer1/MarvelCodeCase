//
//  CharacterDataResponse.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation

// MARK: - Categories
struct CharacterDataResponse: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let data: CharactersListData
    let etag: String?
}

// MARK: - DataClass
struct CharactersListData: Codable {
    let offset, limit, total, count: Int
    let results: [Character]
}

// MARK: - Result
struct Character: Codable {
    let id: Int
    let name: String
    let resultDescription: String?
    let modified: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let thumbnail: Thumbnail
    let comics: Comics?
    let stories: Stories?
    let events, series: Comics?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, resourceURI, urls, thumbnail, comics, stories, events, series
    }
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI, name: String?
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI, name, type: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

//MARK: - Extension
enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
    case unknown = "unknown"
}

// MARK: - URLElement
struct URLElement: Codable {
    let type, url: String?
}

extension Extension {
    public init(from decoder: Decoder) throws {
        self = try Extension(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
