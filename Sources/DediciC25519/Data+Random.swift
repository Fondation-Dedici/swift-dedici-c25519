//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension Data {
    static func random(count: Int) -> Data {
        var bytes = [UInt8](repeating: 0, count: count)
        (0 ..< count).forEach { bytes[$0] = .random(in: .min ... .max) }
        return Data(bytes)
    }
}
