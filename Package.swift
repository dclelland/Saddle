// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Saddle",
    platforms: [
        .macOS(.v13),
        .iOS(.v14)
    ],
    products: [
        .library(name: "Saddle", targets: ["Saddle"])
    ],
    dependencies: [
        .package(url: "https://github.com/dclelland/Plinth", from: "2.6.3")
    ],
    targets: [
        .target(
            name: "Saddle",
            dependencies: [
                .product(name: "Plinth", package: "plinth")
            ]
        )
    ]
)
