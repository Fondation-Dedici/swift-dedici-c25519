//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public protocol DataRepresentable: Hashable, Codable {
    var rawRepresentation: Data { get }
    static var length: Int { get }

    init<Bytes>(from bytes: Bytes) throws where Bytes: Sequence, Bytes.Element == UInt8
}

extension DataRepresentable { // Codable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawRepresentation)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawRepresentation = try container.decode(Data.self)

        try self.init(from: rawRepresentation)
    }
}
