// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftScriptRunner",
    products: [
        .library(
            name: "SwiftScriptRunner",
            targets: ["SwiftScriptRunner"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftScriptRunner",
            dependencies: [],
            path: "Pod/Classes"
        )
    ]
)
