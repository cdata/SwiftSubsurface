// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSubsurface",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftSubsurface",
            targets: ["SwiftSubsurface"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftSubsurface",
            dependencies: ["LibSubsurface"]),
        .binaryTarget(
            name: "LibSubsurface",
            url: "https://github.com/cdata/subconscious-swift-releases/releases/download/libsubsurface-v0.0.1/libsubsurface.zip",
            checksum: "98343a6912bf0018431de9bf51fb41d650197065a5c1f850124e18cc99391084"),
        .testTarget(
            name: "SwiftSubsurfaceTests",
            dependencies: ["SwiftSubsurface"]),
    ]
)
