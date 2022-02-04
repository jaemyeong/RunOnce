// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "RunOnce",
    defaultLocalization: "ko",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "RunOnce",
            targets: [
                "RunOnce"
            ]
        ),
    ],
    targets: [
        .target(
            name: "RunOnce"
        ),
        .testTarget(
            name: "RunOnceTests",
            dependencies: [
                "RunOnce"
            ]
        ),
    ]
)
