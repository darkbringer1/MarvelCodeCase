//
//  CharacterDetailView.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import UIKit
import BaseComponents

class CharacterDetailView: GenericBaseView<CharacterDetailViewData> {
    
    private lazy var collectionView: UICollectionView = {
        let layout = CharacterDetailHeaderFlowLayout()
        layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 500)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(CharacterDetailViewCell.self, forCellWithReuseIdentifier: CharacterDetailViewCell.identifier)
        collection.register(CharacterHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CharacterHeaderReusableView.identifier)
        collection.register(CharacterDetailFooterResuableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CharacterDetailFooterResuableView.identifier)
        return collection
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addCollectionView()
    }
    
    private func addCollectionView() {
        
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    private func setData(to header: CharacterHeaderReusableView) {
        guard let data = returnData(), let headerViewData = data.headerViewData else { return }
        header.setRowData(data: headerViewData)
    }
    
    private func setData(to footer: CharacterDetailFooterResuableView) {
        guard let data = returnData(), let footerViewData = data.comicsViewData else { return }
        footer.setRowData(data: footerViewData)
    }
    
    
    private func getItem(at index: IndexPath) -> TitleViewData {
        guard let data = returnData() else { fatalError("please provide data..")}
        return data.titleViewData[index.row]
    }
    
    private func getNumberOfItems() -> Int {
        guard let data = returnData() else { return 0 }
        return data.titleViewData.count
    }
    
}

extension CharacterDetailView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CharacterHeaderReusableView.identifier, for: indexPath) as? CharacterHeaderReusableView else { return UICollectionReusableView() }
                setData(to: header)
                return header
            case UICollectionView.elementKindSectionFooter:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CharacterDetailFooterResuableView.identifier, for: indexPath) as? CharacterDetailFooterResuableView else { return UICollectionReusableView() }
                setData(to: footer)
                return footer
            default:
                assert(false, "unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 340)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 340)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterDetailViewCell.identifier, for: indexPath) as? CharacterDetailViewCell else { return UICollectionViewCell() }
        cell.setRowData(data: getItem(at: indexPath))
        return cell
    }
    
}
