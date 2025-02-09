// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Module1",
    platforms: [.macOS(.v13), .iOS(.v15), .macCatalyst(.v13)],
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
