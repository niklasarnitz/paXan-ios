// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "paXan",
    products: [],
    dependencies: [
        .package(url: "git@github.com:SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.0")),

        // SwiftyUserDefaults - Modern Swift API for NSUserDefaults
        .package(url: "git@github.com:sunshinejr/SwiftyUserDefaults.git", .upToNextMajor(from: "5.0.0-beta.5")),

        // IQKeyboardManager - Codeless library to prevent general issues with covering UITextFields/UITextViews
        .package(url: "git@github.com:hackiftekhar/IQKeyboardManager.git", from: "6.5.0"),

        // Alamofire - Elegant HTTP Networking in Swift
        .package(url: "git@github.com:Alamofire/Alamofire.git", from: "5.0.0-rc.3"),

        // ObjectMapper - Simple JSON Object mapping written in Swift
        .package(url: "git@github.com:tristanhimmelman/ObjectMapper.git", .upToNextMajor(from: "3.5.1")),

        // AlamofireObjectMapper - An Alamofire extension which converts JSON response data into swift objects using ObjectMapper
//        .package(url: "git@github.com:tristanhimmelman/AlamofireObjectMapper.git", .upToNextMajor(from: "6.2.0")),
    ],
    targets: [
    .target(
        name: "paXan",
        dependencies: [
            "SnapKit",
        ],
        path: "App"
    )
    ]
)

