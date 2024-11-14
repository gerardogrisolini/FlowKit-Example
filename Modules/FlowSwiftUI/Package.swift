// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlowSwiftUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "FlowSwiftUI",
            targets: ["FlowSwiftUI"]),
    ],
    dependencies: [
        .package(path: "../FlowShared"),
        .package(path: "../FlowNetwork"),
    ],
    targets: [
        .target(
            name: "FlowSwiftUI",
            dependencies: ["FlowShared", "FlowNetwork"]
        ),
        .testTarget(
            name: "FlowSwiftUITests",
            dependencies: ["FlowSwiftUI"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
