//
//  File.swift
//  
//
//  Created by Nicolas Klein on 01/12/2022.
//

import Foundation

extension VRFSignature.RandomData {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = VRFSignature.RandomData.length, actualLength: Int)
    }
}
