//
//  CharactersCollectionView.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation
import UIKit
import BaseComponents

class CharactersCollectionView: GenericBaseView<CharactersCollectionViewData> {
    
    weak var dataProvider: DataProviderProtocol?
    
    lazy var componentCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let coll = UICollectionView(frame: .zero, collectionViewLayout: layout)
        coll.translatesAutoresizingMaskIntoConstraints = false
        coll.delegate = self
        coll.dataSource = self
        coll.register(CharacterCollectionCell.self, forCellWithReuseIdentifier: CharacterCollectionCell.identifier)
        coll.register(LoadingCellView.self, forCellWithReuseIdentifier: LoadingCellView.identifier)
        return coll
    }()
    
    //MARK: - EMPTY VIEW WILL BE CALLED FROM HERE
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addCollectionView()
    }
    private func addCollectionView() {
        
        addSubview(componentCollection)
        
        NSLayoutConstraint.activate([
            
            componentCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            componentCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            componentCollection.topAnchor.constraint(equalTo: topAnchor),
            componentCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.componentCollection.reloadData()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
//        return delegate?.isLoadingCell(for: indexPath.row) ?? false
        return false
    }
    
}

extension CharactersCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider?.askNumberOfItem(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isLoadingCell(for: indexPath) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCellView.identifier, for: indexPath) as? LoadingCellView else { fatalError("Loading cell error") }
            return cell
        } else {
            guard let data = dataProvider?.askData(at: indexPath.row) else { fatalError("Please provide at least one item...")}
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionCell.identifier, for: indexPath) as? CharacterCollectionCell else { fatalError(" Please provide a registered cell...")}
            cell.setData(by: data)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            dataProvider?.getMoreData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.isUserInteractionEnabled = false
        cell?.startTappedAnimation(with: { [weak self] finish in
            if finish {
                self?.dataProvider?.selectedItem(at: indexPath.row)
                cell?.isUserInteractionEnabled = true
            }
        })
    }
}

extension CharactersCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 50) / 2
        let height = (UIScreen.main.bounds.height) / 3
        return CGSize(width: width, height: height)
    }
}
