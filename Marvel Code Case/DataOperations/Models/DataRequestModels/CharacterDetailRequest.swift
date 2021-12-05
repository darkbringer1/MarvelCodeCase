//
//  CharacterDetailRequest.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation

struct CharacterDetailRequest: Codable {
    
    private(set) var characterId: Int?
    private(set) var ts: String
    private(set) var apikey: String
    private(set) var hash: String
    
    init(characterId: Int? = nil,
         ts: String,
         apikey: String,
         hash: String) {
        self.characterId = characterId
        self.ts = ts
        self.apikey = apikey
        self.hash = hash
    }
    
}
