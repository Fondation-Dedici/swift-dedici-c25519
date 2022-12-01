//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Crypto
import Foundation

public struct PrivateKey: DataRepresentable {
    public static let length: Int = 32

    public let rawRepresentation: Data
    public let publicKey: PublicKey

    init(from key: Curve25519.KeyAgreement.PrivateKey) {
        let rawRepresentation = key.rawRepresentation
        let publicKey = PublicKey(from: key.publicKey)

        self.rawRepresentation = rawRepresentation
        self.publicKey = publicKey
    }
}

extension PrivateKey {
    /// Initializes a new private key.
    public init() {
        let key = Curve25519.KeyAgreement.PrivateKey()

        self.init(from: key)
    }

    /// Initializes a private key from a given sequence of bytes (existing private key).
    ///
    /// The given byte sequence will be tested for length and validity.
    ///
    /// - throws: `PrivateKey.Error.wrongLength` if the given bytes are not the expected length.
    /// `PrivateKey.Error.invalidPrivateKey` if the given bytes do not represent a valid private key.
    public init<Bytes>(from bytes: Bytes) throws where Bytes: Sequence, Bytes.Element == UInt8 {
        let data = Data(bytes)
        guard data.count == Self.length else { throw Error.wrongLength(actualLength: data.count) }
        let key: Curve25519.KeyAgreement.PrivateKey
        do {
            key = try .init(rawRepresentation: data)
        } catch {
            throw Error.invalidPrivateKey(innerError: error)
        }

        self.init(from: key)
    }
}
