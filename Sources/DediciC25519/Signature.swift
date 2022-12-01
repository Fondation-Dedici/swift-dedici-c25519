//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public struct Signature: DataRepresentable {
    public static let length: Int = 64

    public let rawRepresentation: Data
}

extension Signature {
    /// Initializes a signature from a given sequence of bytes (existing signature).
    ///
    /// The given byte sequence will be tested for length.
    ///
    /// - throws: `Signature.Error.wrongLength` if the given bytes are not the expected length.
    public init<Bytes>(from bytes: Bytes) throws where Bytes: Sequence, Bytes.Element == UInt8 {
        let data = Data(bytes)
        guard data.count == Self.length else { throw Error.wrongLength(actualLength: data.count) }

        self.rawRepresentation = data
    }
}
