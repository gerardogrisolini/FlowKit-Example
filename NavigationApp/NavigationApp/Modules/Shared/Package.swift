// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [.macOS(.v14), .iOS(.v16), .macCatalyst(.v14)],
    products: [
        .library(
            name: "Shared",
            targets: ["Shared"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gerardogrisolini/FlowKit.git", from: "3.0.0")
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
