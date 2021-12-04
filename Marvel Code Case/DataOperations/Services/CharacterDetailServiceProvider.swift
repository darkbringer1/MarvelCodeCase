//
//  CharacterDetailServiceProvider.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CharacterDetailServiceProvider: ApiServiceProvider<CharacterDetailRequest> {
    
    init(request: CharacterDetailRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.main.value,
                   path: Path.detail(request.characterId ?? 0).value,
                   data: request)
    }
    
}
