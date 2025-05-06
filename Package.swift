
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
        )
    ],
    dependencies: [
        // Add external dependencies here if needed
    ],
    targets: [
        .target(
            name: "SampleOTP",
            path: "Sources/SampleOTP"
        ),
        .testTarget(
            name: "SampleOTPTests",
            dependencies: ["SampleOTP"],
            path: "Tests/SampleOTPTests"
        )
    ]
)
