//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Curve25519
import Foundation

extension PrivateKey {
    /// Calculates a signature for the given material. If random data is not provided, the default RNG will be used.
    ///
    /// - parameters:
    ///    - material: The material from which to generate the signature.
    ///    - randomData: The random data to use to calculate de signature.
    /// - returns: The signature
    /// - throws: `Signature.Error.failedToProduceSignature` if the implementation failed to calculate the signature.
    public func signature(
        for material: Data,
        using randomData: Signature.RandomData = .init()
    ) throws -> Signature {
        let signatureData: Data
        do {
            signatureData = try Curve25519.signature(
                for: material,
                privateKey: rawRepresentation,
                randomData: randomData.rawRepresentation
            )
        } catch {
            throw Signature.Error.failedToProduceSignature(innerError: error)
        }
        return try .init(from: signatureData)
    }

    /// Calculates a VRF signature for the given material.
    /// If the random data is not provided, the default RNG will be used to produce it.
    ///
    /// - parameters:
    ///    - material: The material from which to generate the signature.
    ///    - randomData: The random data to use to calculate de signature.
    /// - returns: The signature
    /// - throws: `VRFSignature.Error.failedToProduceSignature` if the implementation failed to calculate the signature.
    public func vrfSignature(
        for material: Data,
        using randomData: VRFSignature.RandomData = .init()
    ) throws -> VRFSignature {
        let signatureData: Data
        do {
            signatureData = try Curve25519.vrfSignature(
                for: material,
                privateKey: rawRepresentation,
                randomData: randomData.rawRepresentation
            )
        } catch {
            throw VRFSignature.Error.failedToProduceSignature(innerError: error)
        }
        return try .init(from: signatureData)
    }
}
