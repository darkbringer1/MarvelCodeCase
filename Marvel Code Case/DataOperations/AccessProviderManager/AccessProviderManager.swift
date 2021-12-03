//
//  AccessProviderManager.swift
//  Marvel Code Case
//
//  Created by DarkBringer on 3.12.2021.
//

import Foundation
import CommonCrypto

class AccessProviderManager: AccessProviderProtocol {
    
    private var hash = ""
    private let publicKey = "1960b982b0ca2b5b6a7d0bed9c36ee29"
    private let privateKey = "e23d3d945d927d2bf2a4bdffb796aeb442955547"
    
    func returnUniqueData() -> String {
        let uniqueId = "\(UUID())"
        hash = MD5(uniqueId: uniqueId).map { String(format: "%02hhx", $0) }.joined()
        return uniqueId
    }
    
    func returnApiKey() -> String {
        return publicKey
    }
    
    func returnHash() -> String {
        return hash
    }
    
    private func MD5(uniqueId: String) -> Data {
        
        let value = "\(uniqueId)\(privateKey)\(publicKey)"
        
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = value.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        
        return digestData
    }
    
    
}
