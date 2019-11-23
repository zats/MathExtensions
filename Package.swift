// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "MathExtensions",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        .library(name: "MathExtensions", targets: ["MathExtensions"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "MathExtensions", dependencies: []),
    ]
)
