// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Example",
    defaultLocalization: "en",
	platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "Example",
            targets: ["Example"]
		)
    ],
	dependencies: [
		.package(path: "../../Modules/FlowShared"),
        .package(path: "../../Modules/FlowNetwork")
	],
    targets: [
        .target(
            name: "Example",
			dependencies: ["FlowShared", "FlowNetwork"],
			resources: [.process("Resources")]
		),
        .testTarget(
            name: "ExampleTests",
            dependencies: ["Example"]
		)
    ],
    swiftLanguageModes: [.v6]
)
