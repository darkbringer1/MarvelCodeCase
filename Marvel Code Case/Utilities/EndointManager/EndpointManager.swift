//
//  EndpointManager.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation
import BaseComponents

typealias BaseUrl = EndpointManager.BaseURL
typealias Path = EndpointManager.Paths

enum EndpointManager {
    
    enum BaseURL: GenericValueProtocol {
        
        typealias Value = String
        
        case main
        var value: String {
            switch self {
                case .main:
                    return "https://gateway.marvel.com/v1/public"
            }
        }
    }
    
    enum Paths: GenericValueProtocol {
        typealias Value = String
        
        case characters
        case detail(Int)
        
        var value: String {
            switch self {
                case .characters:
                    return "characters"
                case .detail(let characterId):
                    return "characters/\(characterId)"
            }
        }
    }
}

