//
//  TitleContainerView.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 5.12.2021.
//

import UIKit
import BaseComponents

class TitleContainerView: GenericBaseView<TitleContainerViewData> {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var title: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .left
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(title)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            
            title.topAnchor.constraint(equalTo: containerView.topAnchor),
            title.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 26),
            title.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        title.text = data.title
    }
    
}
