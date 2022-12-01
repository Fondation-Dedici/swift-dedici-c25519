//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public struct VRFSignature: DataRepresentable {
    public static let length: Int = 96

    public let rawRepresentation: Data
}

extension VRFSignature {
    /// Initializes a VRF signature from a given sequence of bytes (existing VRF signature).
    ///
    /// The given byte sequence will be tested for length.
    ///
    /// - throws: `VRFSignature.Error.wrongLength` if the given bytes are not the expected length.
    public init<Bytes>(from bytes: Bytes) throws where Bytes: Sequence, Bytes.Element == UInt8 {
        let data = Data(bytes)
        guard data.count == Self.length else { throw Error.wrongLength(actualLength: data.count) }

        self.rawRepresentation = data
    }
}
