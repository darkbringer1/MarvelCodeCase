//
//  MainViewController.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import UIKit
import BaseComponents

class MainViewController: BaseViewController<MainViewModel> {
    
    private var mainComponent: CharactersCollectionView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addMainComponent()
        addViewModelListener()
    }
    
    private func addMainComponent() {
        mainComponent = CharactersCollectionView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        mainComponent.dataProvider = viewModel
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
            
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }
    
    func addViewModelListener() {
        viewModel.getData()
        viewModel.subscribeViewState { [weak self] state in
            switch state {
                case .loading:
                    return
                case .done:
                    self?.mainComponent.reloadCollectionView()
                case .failed:
                    return
            }
        }
        viewModel.subscribeDetailViewState { [weak self] data in
            self?.fireDetailView(with: data)
        }
    }
    
    private func fireDetailView(with data: CharacterDetailViewRequest) {
        let viewController = CharacterDetailViewBuilder.build(with: data)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    
}
