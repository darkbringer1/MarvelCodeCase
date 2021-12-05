//
//  CharacterDetailViewModel.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage

typealias CharacterDetailDataBlock = (CharacterDetailViewData) -> Void
typealias DetailViewStateBlock = (DetailViewState) -> Void
class CharacterDetailViewModel {
    
    private let formatter: CharacterDetailDataFormatterProtocol
    private let data: CharacterDetailViewRequest
    private let accessProviderManager: AccessProviderProtocol
    private var dataState: CharacterDetailDataBlock?
    private var detailViewState: DetailViewStateBlock?
    
    init(formatter: CharacterDetailDataFormatterProtocol,
         data: CharacterDetailViewRequest,
         accessProviderManager: AccessProviderProtocol) {
        self.formatter = formatter
        self.data = data
        self.accessProviderManager = accessProviderManager
    }
    
    func getCharacterData() {
        detailViewState?(.charactersLoading)
        do {
            guard let urlRequest = try? CharacterDetailServiceProvider(request: getCharacterDetailRequest()).returnUrlRequest(headerType: .contentType) else { return }
            fireCharacterApiCall(urlRequest: urlRequest, completion: characterDataListener)
        }
    }
    
    func getComicsData() {
        detailViewState?(.comicsLoading)
        do {
            guard let urlRequest = try? ComicsListServiceProvider(request: getComicsRequest()).returnUrlRequest(headerType: .contentType) else { return }
            fireComicsApiCall(urlRequest: urlRequest, completion: comicsDataListener)
        }
    }
    
    func subscribeDataState(with completion: @escaping CharacterDetailDataBlock) {
        dataState = completion
    }
    
    func subscribeDetailViewState(with completion: @escaping DetailViewStateBlock) {
        detailViewState = completion
    }
    
    private func fireComicsApiCall(urlRequest: URLRequest, completion: @escaping (Result<ComicsDataResponse, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
    }
    
    private func fireCharacterApiCall(urlRequest: URLRequest, completion: @escaping (Result<CharacterDataResponse, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
    }
    
    private func getCharacterDetailRequest() -> CharacterDetailRequest {
        return CharacterDetailRequest(characterId: data.id,
                                      ts: accessProviderManager.returnUniqueData(),
                                      apikey: accessProviderManager.returnApiKey(),
                                      hash: accessProviderManager.returnHash())
    }
    private func getComicsRequest() -> ComicsDataRequest {
        return ComicsDataRequest(characterId: data.id,
                                 dateRange: rangeCreator(),
                                 ts: accessProviderManager.returnUniqueData(),
                                 apikey: accessProviderManager.returnApiKey(),
                                 hash: accessProviderManager.returnHash())
    }
    
    private lazy var characterDataListener: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        switch result {
            case .failure(let error):
                print("error data listener: \(error)")
            case .success(let response):
                self?.characterResponseHandler(from: response)
        }
    }
    
    private lazy var comicsDataListener: (Result<ComicsDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        switch result {
            case .failure(let error):
                print("error comics listener: \(error)")
            case .success(let response):
                self?.comicsResponseHandler(form: response)
        }
    }
    private func comicsResponseHandler(form comicsResponse: ComicsDataResponse) {
        dataState?(formatter.getComicsData(from: comicsResponse))
        detailViewState?(.comicsDone)
    }
    
    private func characterResponseHandler(from characterResponse: CharacterDataResponse) {
        dataState?(formatter.getCharacterDetailData(from: characterResponse))
        detailViewState?(.charactersDone)
    }
    
    private func rangeCreator() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        let now = formatter.string(from: Date())
        return "2005-01-01,\(now)"
        
    }
    
}
