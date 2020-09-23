// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "UIDeviceModel",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "UIDeviceModel", targets: [
            "UIDeviceModel",
        ]),
    ],
    targets: [
        .target(name: "UIDeviceModel"),
    ]
)
