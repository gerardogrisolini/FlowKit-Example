// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlowUIKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "FlowUIKit",
            targets: ["FlowUIKit"]),
    ],
    dependencies: [.package(path: "../FlowShared")],
    targets: [
        .target(
            name: "FlowUIKit",
            dependencies: ["FlowShared"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "FlowUIKitTests",
            dependencies: ["FlowUIKit"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
