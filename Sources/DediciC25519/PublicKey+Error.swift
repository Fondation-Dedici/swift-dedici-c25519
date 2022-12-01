//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension PublicKey {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = PublicKey.length, actualLength: Int)
        case invalidPublicKey(innerError: Swift.Error)
    }
}
