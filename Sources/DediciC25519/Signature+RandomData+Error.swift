//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension Signature.RandomData {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = Signature.RandomData.length, actualLength: Int)
    }
}
