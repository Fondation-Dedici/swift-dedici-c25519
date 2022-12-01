// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "swift-dedici-c25519",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "DediciC25519",
            targets: ["DediciC25519"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto", from: "2.2.1"),
        .package(url: "https://github.com/christophhagen/Curve25519", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "DediciC25519",
            dependencies: [
                .product(name: "Curve25519", package: "Curve25519"),
                .product(name: "Crypto", package: "swift-crypto"),
            ]
        ),
        .testTarget(
            name: "DediciC25519Tests",
            dependencies: ["DediciC25519"]
        ),
    ]
)
