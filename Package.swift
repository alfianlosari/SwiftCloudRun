// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "hello-swift-cloud-run",
    dependencies: [
        .package(url: "https://github.com/httpswift/swifter.git", .upToNextMajor(from: "1.4.6"))
    ],
    targets: [
        .target(
            name: "hello-swift-cloud-run",
            dependencies: ["Swifter"]),
        .testTarget(
            name: "hello-swift-cloud-runTests",
            dependencies: ["hello-swift-cloud-run"]),
    ]
)
