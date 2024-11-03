// swift-tools-version: 6.0
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
        .package(url: "https://github.com/gerardogrisolini/FlowKit.git", from: "2.0.0")
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
    ],
    swiftLanguageModes: [.v6]
)
