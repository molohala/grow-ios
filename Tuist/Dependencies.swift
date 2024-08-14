import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: .init(
        [
            .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.8.1")),
            .remote(url: "https://github.com/apple/swift-crypto.git", requirement: .upToNextMajor(from: "3.0.0")),
            .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.22.0")),
            .remote(url: "https://github.com/EmergeTools/Pow.git", requirement: .exact("1.0.3")),
//            .remote(url: "https://github.com/kean/Nuke.git", requirement: .exact("12.5")),
            .remote(url: "https://github.com/tevelee/SwiftUI-Flow.git", requirement: .exact("1.1.0")),
            .remote(url: "https://github.com/bestswlkh0310/my-ios-designsystem.git", requirement: .exact("0.1.6")),
            .remote(url: "https://github.com/satoshi-takano/OpenGraph.git", requirement: .exact("1.4.1")),
            .remote(url: "https://github.com/firebase/firebase-ios-sdk", requirement: .exact("10.19.0"))
        ]
    ),
    platforms: [.iOS, .macOS]
)
