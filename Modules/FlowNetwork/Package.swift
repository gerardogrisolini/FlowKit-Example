// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlowNetwork",
	platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "FlowNetwork",
            targets: ["FlowNetwork"]
		)
    ],
	dependencies: [
        .package(url: "https://github.com/gerardogrisolini/FlowKit.git", from: "1.0.4")
    ],
    targets: [
        .target(
            name: "FlowNetwork",
			dependencies: ["FlowKit"]
		),
        .testTarget(
            name: "FlowNetworkTests",
            dependencies: ["FlowNetwork"]
		)
    ]
)
