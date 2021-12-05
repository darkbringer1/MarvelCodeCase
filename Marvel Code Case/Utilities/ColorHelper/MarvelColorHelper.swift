//
//  MarvelColorHelper.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 6.12.2021.
//

import UIKit
import BaseComponents

enum MarvelColorHelper: GenericValueProtocol {
    
    typealias Value = UIColor
    
    case marvelRed
    case defaultBackground
    
    var value: UIColor {
        switch self {
            case .marvelRed:
                return #colorLiteral(red: 0.7843137255, green: 0.2117647059, blue: 0.2117647059, alpha: 1)
            case .defaultBackground:
                return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}

