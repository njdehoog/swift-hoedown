// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "SwiftHoedown",
    products: [
        .library(
            name: "SwiftHoedown",
            targets: ["SwiftHoedown"]
        ),
        .executable(
            name: "DemoApp",
            targets: ["DemoApp"]
        )
    ],
    targets: [
        .target(
            name: "SwiftHoedown",
            dependencies: ["CHoedown"]),
        .target(
            name: "DemoApp",
            dependencies: ["SwiftHoedown"]),
        .target(
            name: "CHoedown",
            dependencies: []),
        .testTarget(
            name: "HoedownTest",
            dependencies: ["SwiftHoedown"])
    ]
)
