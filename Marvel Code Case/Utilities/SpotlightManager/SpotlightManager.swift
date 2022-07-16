//
//  SpotlightManager.swift
//  Marvel Code Case
//
//  Created by Dogukaan Kılıçarslan on 12.07.2022.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

struct SpotlightModel {
    let id: String
    var title: String
    var content: String
    var keywords: [String]
}

enum SpotlightManager {
    static let domainIdentifier = "com.dogukaan.Marvel-Code-Case"

    static func configureSearchableItems() {

        let match = SpotlightModel(id: "0",
                                   title: "Marvel Heroes",
                                   content: "Tap to see your favourite Marvel heroes",
                                   keywords: [
                                    "marvel heroes",
                                    "marvel",
                                    "heroes",
                                    "captain america",
                                    "thor",
                                    "iron man",
                                    "hulk",
                                    "antman"
                                   ])

        var matches: [SpotlightModel] = []
        matches.append(match)

        let searchableItems = matches.map { item -> CSSearchableItem in
            let attributeSet: CSSearchableItemAttributeSet
            if #available(iOS 14, *) {
                attributeSet = .init(contentType: .content)
            } else {
                attributeSet = .init(itemContentType: kUTTypeText as String)
            }
            attributeSet.title = item.title
            attributeSet.contentDescription = item.content
            attributeSet.relatedUniqueIdentifier = item.id
            attributeSet.keywords = item.keywords

            return CSSearchableItem(
                uniqueIdentifier: item.id,
                domainIdentifier: SpotlightManager.domainIdentifier,
                attributeSet: attributeSet
            )
        }
        indexSearchableItems(items: searchableItems)
    }

    private static func indexSearchableItems(items: [CSSearchableItem]) {
        CSSearchableIndex.default().indexSearchableItems(items) { error in
            if let error = error {
                debugPrint(error)
            } else {
                debugPrint("indexing successful")
            }
        }
    }
    
    static func deleteIndexedSearchableItems() {
        CSSearchableIndex.default().deleteAllSearchableItems() { error in
            if let error = error {
                debugPrint(error)
            } else {
                debugPrint("index deleted successfully")
            }
        }
    }
}
