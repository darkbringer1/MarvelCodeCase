//
//  ComicsRequestModel.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import Foundation

struct ComicsDataRequest: Codable {
    
    private(set) var characterId: Int?
    private(set) var dateRange: String
    private(set) var orderBy: String = "-issueNumber"
    private(set) var limit: Int = 10
    private(set) var format: String = "comic"
    private(set) var ts: String
    private(set) var apikey: String
    private(set) var hash: String
    
    init(characterId: Int? = nil,
         dateRange: String,
         orderBy: String = "-issueNumber",
         limit: Int = 10,
         format: String = "comic",
         ts: String,
         apikey: String,
         hash: String) {
        self.characterId = characterId
        self.dateRange = dateRange
        self.orderBy = orderBy
        self.limit = limit
        self.format = format
        self.ts = ts
        self.apikey = apikey
        self.hash = hash
    }
    
    enum CodingKeys: String, CodingKey {
        case characterId
        case orderBy
        case limit
        case dateRange
        case format
        case apikey
        case ts
        case hash
    }
}
