// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExampleUIKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "ExampleUIKit",
            targets: ["ExampleUIKit"]),
    ],
    dependencies: [
        .package(path: "../../Modules/FlowShared")
    ],
    targets: [
        .target(
            name: "ExampleUIKit",
            dependencies: ["FlowShared"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ExampleUIKitTests",
            dependencies: ["ExampleUIKit"]
        )
    ]
)
