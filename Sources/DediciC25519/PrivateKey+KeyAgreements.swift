//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Curve25519
import Foundation

extension PrivateKey {
    /// Calculate the shared agreement between this private key and the given public key.
    ///
    /// - throws: `PrivateKey.Error.failedToProduceKeyAgreement`
    ///
    /// - returns: The agreement
    public func agreement(with publicKey: PublicKey) throws -> Data {
        do {
            return try Curve25519.calculateAgreement(
                privateKey: rawRepresentation,
                publicKey: publicKey.rawRepresentation
            )
        } catch {
            throw Error.failedToProduceKeyAgreement(innerError: error)
        }
    }
}
