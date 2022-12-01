//
//  File.swift
//  
//
//  Created by Nicolas Klein on 01/12/2022.
//

import Foundation

extension VRFSignature {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = VRFSignature.length, actualLength: Int)
        case verificationFailed
        case failedToProduceSignature(innerError: Swift.Error)
    }
}
