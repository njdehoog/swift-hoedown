// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Hoedown",
    products: [
        .library(
            name: "SwiftHoedown",
            targets: ["Hoedown"]
        ),
    ],
    targets: [
        .target(
            name: "Hoedown",
            dependencies: ["CHoedown"]),
        .target(
            name: "CHoedown",
            dependencies: []),
        .testTarget(
            name: "HoedownTest",
            dependencies: ["Hoedown"]),
    ]
)
