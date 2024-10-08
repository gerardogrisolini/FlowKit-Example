// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlowShared",
	defaultLocalization: "en",
	platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "FlowShared",
            targets: ["FlowShared"]
		)
    ],
	dependencies: [
        .package(url: "https://github.com/gerardogrisolini/FlowKit.git", from: "1.0.3")
	],
    targets: [
        .target(
            name: "FlowShared",
			dependencies: ["FlowKit"],
			resources: [.process("Resources")]
		),
        .testTarget(
            name: "FlowSharedTests",
            dependencies: ["FlowShared"]
		)
    ]
)
