//
//  MainViewModel.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation
import BaseComponents
import DefaultNetworkOperationPackage

typealias CharacterDetailRequestBlock = (CharacterDetailViewRequest) -> Void

class MainViewModel {
    
    private var dataFormatter: MainViewDataFormatterProtocol
    private var accessProviderManager: AccessProviderProtocol
    private var mainViewState: ((ViewState) -> Void)?
    private var detailViewState: CharacterDetailRequestBlock?
    
    
    init(dataFormatter: MainViewDataFormatterProtocol,
         accessProviderManager: AccessProviderProtocol) {
        self.dataFormatter = dataFormatter
        self.accessProviderManager = accessProviderManager
    }
    
    func getData() {
        mainViewState?(.loading)
        do {
            guard let urlRequest = try? CharacterListServiceProvider(request: getCharacterDataRequest()).returnUrlRequest(headerType: .contentType) else { return }
            print(urlRequest)
            fireApiCall(with: urlRequest, with: dataListener)
            
        }
    }
    
    func subscribeViewState(with completion: @escaping (ViewState) -> Void) {
        mainViewState = completion
    }
    
    func subscribeDetailViewState(with completion: @escaping CharacterDetailRequestBlock) {
        detailViewState = completion
    }
    
    private lazy var dataListener: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        
        self?.dataFormatter.paginationData.fetching = false
        
        switch result {
            case .failure(let error):
                print("Error data listener: \(error)")
            case .success(let response):
                self?.apiCallHandler(from: response)
        }
    }

    private func apiCallHandler(from response: CharacterDataResponse) {
        dataFormatter.setData(with: response)
        mainViewState?(.done)
    }
    
    private func fireApiCall(with urlRequest: URLRequest, with completion: @escaping (Result<CharacterDataResponse, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
    }
    
    private func getCharacterDataRequest() -> CharacterDataRequest {
        return CharacterDataRequest(offset: dataFormatter.paginationData.offset,
                                    limit: dataFormatter.paginationData.limit,
                                    ts: accessProviderManager.returnUniqueData(),
                                    apikey: accessProviderManager.returnApiKey(),
                                    hash: accessProviderManager.returnHash())
    }
    
}

extension MainViewModel: DataProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return dataFormatter.getNumbeOfItem(in: section)
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return dataFormatter.getItem(at: index)
    }
    func isLoadingCell(for index: Int) -> Bool {
        return index >= dataFormatter.getCount()
    }
    
    func getMoreData() {
        guard dataFormatter.paginationData.checkLoadingMore() else { return }
        dataFormatter.paginationData.nextOffset()
        getData()
    }
    
    func selectedItem(at index: Int) {
        print("tapped index: \(index)")
        detailViewState?(CharacterDetailViewRequest(id: dataFormatter.getItemId(at: index)))
    }
    
}
