//
//  File.swift
//  
//
//  Created by Nicolas Klein on 01/12/2022.
//

import Foundation

extension Signature.RandomData {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = Signature.RandomData.length, actualLength: Int)
    }
}
