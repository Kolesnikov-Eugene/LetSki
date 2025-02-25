// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MapView",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "MapView",
            targets: ["MapView"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/uber/needle.git", .upToNextMajor(from: "0.25.1")),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "1.17.1")),
    ],
    targets: [
        .target(
            name: "MapView",
            dependencies: [
                .product(name: "NeedleFoundation", package: "needle"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        .testTarget(
            name: "MapViewTests",
            dependencies: ["MapView"]
        ),
    ]
)

//import PackageDescription
//
//let package = Package(
//    name: "LetSkiView",
//    platforms: [.iOS(.v17)],
//    products: [
//        .library(
//            name: "MapView",
//            targets: ["MapView"]
//        ),
//    ],
//    dependencies: [
//        .package(url: "https://github.com/uber/needle.git", from: "0.25.1"),
//        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.17.1"),
//    ],
//    targets: [
//        .target(
//            name: "MapView",
//            dependencies: [
//                .product(name: "NeedleFoundation", package: "needle"),
//                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
//            ]
//        ),
//        .testTarget(
//            name: "MapView",
//            dependencies: ["MapView"]
//        ),
//    ]
//)
