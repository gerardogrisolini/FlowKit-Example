// swift-tools-version: 6.0
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
        .package(url: "https://github.com/gerardogrisolini/FlowKit.git", from: "2.0.0")
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
    ],
    swiftLanguageModes: [.v6]
)
