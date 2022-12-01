//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension VRFSignature.RandomData {
    public enum Error: Swift.Error {
        case wrongLength(expectedLength: Int = VRFSignature.RandomData.length, actualLength: Int)
    }
}
