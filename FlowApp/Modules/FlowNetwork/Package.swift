// swift-tools-version: 6.2
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
    dependencies: [
        .package(path: "../FlowShared")
    ],
    targets: [
        .target(
            name: "FlowNetwork",
            dependencies: ["FlowShared"]
        ),
        .testTarget(
            name: "FlowNetworkTests",
            dependencies: ["FlowNetwork"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
