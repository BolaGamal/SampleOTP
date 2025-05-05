//
//  Untitled.swift
//  SampleOTP
//
//  Created by Bola Gamal on 5/5/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "SampleOTP",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "SampleOTP",
            targets: ["SampleOTP"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SampleOTP",
            dependencies: [],
            path: "Sources/SampleOTP"
        ),
        .testTarget(
            name: "SampleOTPTests",
            dependencies: ["SampleOTP"],
            path: "Tests/SampleOTPTests"
        )
    ]
)
