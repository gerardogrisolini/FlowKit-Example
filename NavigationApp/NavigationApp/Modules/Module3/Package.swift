// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Module3",
    platforms: [.macOS(.v14), .iOS(.v16), .macCatalyst(.v14)],
    products: [
        .library(
            name: "Module3",
            targets: ["Module3"]),
    ],
    dependencies: [
        .package(path: "../Shared")
    ],
    targets: [
        .target(
            name: "Module3",
            dependencies: ["Shared"]
        ),
        .testTarget(
            name: "Module3Tests",
            dependencies: ["Module3"]
        ),
    ]
)
