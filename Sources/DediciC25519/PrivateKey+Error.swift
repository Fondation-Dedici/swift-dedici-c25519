//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension PrivateKey {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = PrivateKey.length, actualLength: Int)
        case failedToProduceKeyAgreement(innerError: Swift.Error)
        case invalidPrivateKey(innerError: Swift.Error)
    }
}
