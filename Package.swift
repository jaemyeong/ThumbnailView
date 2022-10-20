// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "ThumbnailView",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "ThumbnailView",
            targets: [
                "ThumbnailView"
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/jaemyeong/OpenColorKit.git", .upToNextMajor(from: "0.1.7")),
        .package(url: "https://github.com/jaemyeong/ErrorKit.git", .upToNextMajor(from: "0.1.8")),
    ],
    targets: [
        .target(
            name: "ThumbnailView",
            dependencies: [
                "ErrorKit",
                "OpenColorKit",
            ]
        ),
        .testTarget(
            name: "ThumbnailViewTests",
            dependencies: [
                "ThumbnailView"
            ]
        ),
    ]
)

#if swift(>=5.6)

package.dependencies.append(.package(url: "https://github.com/apple/swift-docc-plugin", .upToNextMajor(from: "1.0.0")))

#endif
