// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlowNetwork",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "FlowNetwork",
            targets: ["FlowNetwork"]),
    ],
    targets: [
        .target(
            name: "FlowNetwork"
        ),
        .testTarget(
            name: "FlowNetworkTests",
            dependencies: ["FlowNetwork"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
