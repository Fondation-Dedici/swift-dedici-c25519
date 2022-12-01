//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension VRFSignature {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = VRFSignature.length, actualLength: Int)
        case verificationFailed
        case failedToProduceSignature(innerError: Swift.Error)
    }
}
