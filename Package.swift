// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "paXan",
    products: [],
    dependencies: [
        // add your dependencies here, for example:
	.package(url: "git@github.com:SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.0")),
	.package(url: "git@github.com:sunshinejr/SwiftyUserDefaults.git", .upToNextMajor(from: "5.0.0-beta.5")),
    ],
    targets: [
        .target(
            name: "paXan",
            dependencies: [
		"SnapKit",
		"SwiftyUserDefaults"
            ],
            path: "App"
        ),
    ]
)
