// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [.macOS(.v13), .iOS(.v15), .macCatalyst(.v13)],
    products: [
        .library(
            name: "Shared",
            targets: ["Shared"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gerardogrisolini/FlowKit.git", from: "2.5.5")
    ],
    targets: [
        .target(
            name: "Shared",
            dependencies: [
                .product(name: "NavigationKit", package: "FlowKit")
            ]
        ),
        .testTarget(
            name: "SharedTests",
            dependencies: ["Shared"]
        ),
    ]
)
