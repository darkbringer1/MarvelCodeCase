//
//  CharacterDataRequest.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation

struct CharacterDataRequest: Codable {
    
    private(set) var characterId: Int?
    private(set) var offset: Int = 0
    private(set) var limit: Int = 30
    private(set) var ts: String
    private(set) var apiKey: String
    private(set) var hash: String
    
    init(characterId: Int? = nil,
         offset: Int = 0,
         limit: Int = 30,
         ts: String,
         apiKey: String,
         hash: String) {
        self.characterId = characterId
        self.offset = offset
        self.limit = limit
        self.ts = ts
        self.apiKey = apiKey
        self.hash = hash
    }
    
}
