// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyStaticPackage",
    products: [
        .library(
            name: "MyStaticPackage",
            targets: ["MyStaticTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", "5.4.0"..."5.6.4"),
    ],
    targets: [
        .target(
            name: "MyStaticTarget",
            dependencies: [
                .target(name: "MyStaticWrapper")
            ],
            path: "./Sources/MyStaticTarget"
        ),
        .target(
            name: "MyStaticWrapper",
            dependencies: [
                .target(name: "MyStaticLib"),
                .product(name: "Alamofire", package: "Alamofire"),
            ],
            path: "./Sources/MyStaticWrapper"
        ),
        .binaryTarget(
            name: "MyStaticLib",
            path: "./Sources/MyStaticPackage/MyStaticLib.xcframework")
    ]
)
