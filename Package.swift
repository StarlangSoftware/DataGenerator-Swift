// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataGenerator",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DataGenerator",
            targets: ["DataGenerator"]),
    ],
    dependencies: [
        .package(name: "AnnotatedTree", url: "https://github.com/StarlangSoftware/AnnotatedTree-Swift.git", .exact("1.0.5")),
        .package(name: "Classification", url: "https://github.com/StarlangSoftware/Classification-Swift.git", .exact("1.0.2")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DataGenerator",
            dependencies: ["AnnotatedTree", "Classification"]),
        .testTarget(
            name: "DataGeneratorTests",
            dependencies: ["DataGenerator"]),
    ]
)
