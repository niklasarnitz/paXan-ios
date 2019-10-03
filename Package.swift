// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "paXan",
    products: [],
    dependencies: [
        // add your dependencies here, for example:
	.package(url: "git@github.com:SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .target(
            name: "paXan",
            dependencies: [
		"SnapKit",
            ],
            path: "App"
        ),
    ]
)
