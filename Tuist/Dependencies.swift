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
            .remote(url: "https://github.com/kean/Nuke.git", requirement: .exact("12.5"))
        ]
    ),
    platforms: [.iOS]
)
