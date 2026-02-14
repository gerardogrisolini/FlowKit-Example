// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Module1",
    platforms: [.macOS(.v14), .iOS(.v16), .macCatalyst(.v14)],
    products: [
        .library(
            name: "Module1",
            targets: ["Module1"]
        ),
    ],
    dependencies: [
        .package(path: "../Shared")
    ],
    targets: [
        .target(
            name: "Module1",
            dependencies: ["Shared"]
        ),
        .testTarget(
            name: "Module1Tests",
            dependencies: ["Module1"]
        ),
    ]
)
