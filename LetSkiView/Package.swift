// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LetSkiView",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "LetSkiView",
            targets: ["LetSkiView"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/uber/needle.git", .upToNextMajor(from: "0.25.1")),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "1.17.1")),
        .package(path: "../LetSkiShared")
    ],
    targets: [
        .target(
            name: "LetSkiView",
            dependencies: [
                .product(name: "NeedleFoundation", package: "needle"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "LetSkiShared", package: "LetSkiShared")
            ],
            resources: [.process("Assets.xcassets")]
        ),
        .testTarget(
            name: "LetSkiViewTests",
            dependencies: ["LetSkiView"]
        ),
    ]
)
