// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Module2",
    platforms: [.macOS(.v14), .iOS(.v16), .macCatalyst(.v14)],
    products: [
        .library(
            name: "Module2",
            targets: ["Module2"]),
    ],
    dependencies: [
        .package(path: "../Shared")
    ],
    targets: [
        .target(
            name: "Module2",
            dependencies: ["Shared"]
        ),
        .testTarget(
            name: "Module2Tests",
            dependencies: ["Module2"]
        ),
    ]
)
