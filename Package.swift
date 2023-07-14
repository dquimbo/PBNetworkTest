// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PBNetwokLib",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PBNetwokLib",
            targets: ["PBNetwokWrapper"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ReactiveX/RxSwift",
            from: "6.0.0"
        ),
        .package(
            url: "https://github.com/realm/realm-swift",
            from: "10.0.0"
        ),
        .package(
            url: "https://github.com/dquimbo/CalendarControl",
            from: "4.0.0"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "PBNetworkBinary",
            path: "./Sources/PBNetworkBinary.xcframework"),
        .target(
            name: "PBNetwokWrapper",
            dependencies: [
                .product(name: "RxSwift", package: "rxswift"),
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "PBBluetooth", package: "calendarcontrol"),
                .target(name: "PBNetworkBinary")
            ]),
    ]
)
