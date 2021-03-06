//
//  CharacterDetailViewController.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import UIKit
import BaseComponents

class CharacterDetailViewController: BaseViewController<CharacterDetailViewModel> {
    
    private var mainComponent: CharacterDetailView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addMainComponent()
        viewModel.getCharacterData()
        viewModelListeners()
        navigationController?.backgroundColor(.red)
    }
    
    private func addMainComponent() {
        mainComponent = CharacterDetailView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
            
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            
        ])
        
    }
    
    private func viewModelListeners() {
        viewModel.subscribeDataState { [weak self] data in
            self?.mainComponent.setData(by: data)
        }
        viewModel.subscribeDetailViewState { [weak self] state in
            switch state {
                case .charactersDone:
                    self?.viewModel.getComicsData()
                case .comicsDone:
                    self?.mainComponent.reloadCollectionView()
                default:
                    return
            }
        }
    }
}

