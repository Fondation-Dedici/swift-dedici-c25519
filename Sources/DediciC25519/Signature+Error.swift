//
//  File.swift
//  
//
//  Created by Nicolas Klein on 01/12/2022.
//

import Foundation

extension Signature {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = Signature.length, actualLength: Int)
        case verificationFailed
        case failedToProduceSignature(innerError: Swift.Error)
    }
}
