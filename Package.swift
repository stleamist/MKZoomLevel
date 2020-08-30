// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "MKZoomLevel",
    platforms: [
        .iOS(.v9), .macOS(.v10_11), .tvOS(.v9)
    ],
    products: [
        .library(
            name: "MKZoomLevel",
            targets: ["MKZoomLevel"]),
    ],
    targets: [
        .target(
            name: "MKZoomLevel",
            dependencies: []),
        .testTarget(
            name: "MKZoomLevelTests",
            dependencies: ["MKZoomLevel"]),
    ]
)
