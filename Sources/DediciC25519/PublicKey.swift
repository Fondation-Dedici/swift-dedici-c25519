//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Crypto
import Foundation

public struct PublicKey: DataRepresentable {
    public static let length: Int = 32

    public let rawRepresentation: Data

    init(from key: Curve25519.KeyAgreement.PublicKey) {
        self.rawRepresentation = key.rawRepresentation
    }
}

extension PublicKey {
    /// Initializes a public key from a given sequence of bytes (existing public key).
    ///
    /// The given byte sequence will be tested for length and validity.
    ///
    /// - throws: `PublicKey.Error.wrongLength` if the given bytes are not the expected length.
    /// `PublicKey.Error.invalidPrivateKey` if the given bytes do not represent a valid public key.
    public init<Bytes>(from bytes: Bytes) throws where Bytes: Sequence, Bytes.Element == UInt8 {
        let data = Data(bytes)
        guard data.count == Self.length else { throw Error.wrongLength(actualLength: data.count) }
        let key: Curve25519.KeyAgreement.PublicKey
        do {
            key = try .init(rawRepresentation: data)
        } catch {
            throw Error.invalidPublicKey(innerError: error)
        }

        self.init(from: key)
    }
}
