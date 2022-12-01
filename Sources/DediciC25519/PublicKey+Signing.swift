//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Curve25519
import Foundation

extension PublicKey {
    /// Verifies that the given signature was made from the given material.
    ///
    /// The function throws an error if the signature is not valid. If the signature is valid, nothing happens.
    ///
    /// - throws: `Signature.Error.verificationFailed`
    public func verify<M: DataRepresentable>(_ signature: Signature, wasMadeFrom material: M) throws {
        try verify(signature, wasMadeFrom: material.rawRepresentation)
    }

    /// Verifies that the given signature was made from the given material.
    ///
    /// The function throws an error if the signature is not valid. If the signature is valid, nothing happens.
    ///
    /// - throws: `Signature.Error.verificationFailed`
    public func verify(_ signature: Signature, wasMadeFrom material: Data) throws {
        guard verifies(signature, wasMadeFrom: material) else { throw Signature.Error.verificationFailed }
    }

    /// Verifies that the given signature was made from the given material.
    ///
    /// - returns: `true` if the signature is valid. `false` if the signature is not valid.
    public func verifies<M: DataRepresentable>(_ signature: Signature, wasMadeFrom material: M) -> Bool {
        verifies(signature, wasMadeFrom: material.rawRepresentation)
    }

    /// Verifies that the given signature was made from the given material.
    ///
    /// - returns: `true` if the signature is valid. `false` if the signature is not valid.
    public func verifies(_ signature: Signature, wasMadeFrom material: Data) -> Bool {
        Curve25519.verify(signature: signature.rawRepresentation, for: material, publicKey: rawRepresentation)
    }

    /// Verifies that the given VRF signature was made from the given material.
    ///
    /// The function throws an error if the signature is not valid. If the signature is valid, nothing happens.
    ///
    /// - throws: `VRFSignature.Error.verificationFailed`
    @discardableResult
    public func verify<M: DataRepresentable>(_ signature: VRFSignature, wasMadeFrom material: M) throws -> Data {
        try verify(signature, wasMadeFrom: material.rawRepresentation)
    }

    /// Verifies that the given VRF signature was made from the given material.
    ///
    /// The function throws an error if the signature is not valid. If the signature is valid, nothing happens.
    ///
    /// - throws: `VRFSignature.Error.verificationFailed`
    @discardableResult
    public func verify(_ signature: VRFSignature, wasMadeFrom material: Data) throws -> Data {
        let proof: Data
        do {
            proof = try Curve25519.verify(
                vrfSignature: signature.rawRepresentation,
                for: material,
                publicKey: rawRepresentation
            )
        } catch {
            throw VRFSignature.Error.verificationFailed
        }
        return proof
    }

    /// Verifies that the given VRF signature was made from the given material.
    ///
    /// - returns: `true` if the signature is valid. `false` if the signature is not valid.
    public func verifies<M: DataRepresentable>(_ signature: VRFSignature, wasMadeFrom material: M) -> Bool {
        verifies(signature, wasMadeFrom: material.rawRepresentation)
    }

    /// Verifies that the given VRF signature was made from the given material.
    ///
    /// - returns: `true` if the signature is valid. `false` if the signature is not valid.
    public func verifies(_ signature: VRFSignature, wasMadeFrom material: Data) -> Bool {
        do {
            try verify(signature, wasMadeFrom: material)
            return true
        } catch {
            return false
        }
    }
}
