// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlowData",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "FlowData",
            targets: ["FlowData"]),
    ],
    dependencies: [.package(path: "../FlowShared")],
    targets: [
        .target(
            name: "FlowData",
            dependencies: ["FlowShared"]
        ),
        .testTarget(
            name: "FlowDataTests",
            dependencies: ["FlowData"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
