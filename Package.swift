// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "paXan",
    products: [],
    dependencies: [
        // SnapKit - A Swift Autolayout DSL for iOS & OS X
	    .package(url: "git@github.com:SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.0")),

        // SwiftyUserDefaults - Modern Swift API for NSUserDefaults
	    .package(url: "git@github.com:sunshinejr/SwiftyUserDefaults.git", .upToNextMajor(from: "5.0.0-beta.5")),

        // IQKeyboardManager - Codeless library to prevent general issues with covering UITextFields/UITextViews
	    .package(url: "git@github.com:hackiftekhar/IQKeyboardManager.git", from: "6.5.0"),

        // SwiftyJSON - The better way to deal with JSON data in Swift.
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0"),

        // Alamofire - Elegant HTTP Networking in Swift
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0-rc.3")
    ],
    targets: [
        // Main target of the paXan app, located in the ./App folder
        .target(
            name: "paXan",
            dependencies: [
		        "SnapKit",
		        "SwiftyUserDefaults",
		        "IQKeyboardManagerSwift",
                "SwiftyJSON",
                "Alamofire",
            ],
            path: "App"
        ),
    ]
)
