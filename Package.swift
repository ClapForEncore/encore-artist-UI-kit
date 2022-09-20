// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EncoreUI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "EncoreUI",
            targets: ["EncoreUI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "EncoreUI",
            dependencies: [],
            resources: [.process("Fonts")]),
        .testTarget(
            name: "EncoreUITests",
            dependencies: ["EncoreUI"]),
    ]
)
