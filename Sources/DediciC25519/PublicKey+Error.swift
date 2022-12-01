//
//  File.swift
//  
//
//  Created by Nicolas Klein on 01/12/2022.
//

import Foundation

extension PublicKey {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = PublicKey.length, actualLength: Int)
        case invalidPublicKey(innerError: Swift.Error)
    }
}
