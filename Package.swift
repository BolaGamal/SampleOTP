
// swift-tools-version:5.5
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
