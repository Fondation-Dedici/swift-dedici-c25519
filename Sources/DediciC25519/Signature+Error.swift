//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension Signature {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = Signature.length, actualLength: Int)
        case verificationFailed
        case failedToProduceSignature(innerError: Swift.Error)
    }
}
