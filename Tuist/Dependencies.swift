import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: .init(
        [
            .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.8.1")),
            .remote(url: "https://github.com/apple/swift-crypto.git", requirement: .upToNextMajor(from: "3.0.0")),
            .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.24.0"))
        ]
    ),
    platforms: [.iOS]
)
