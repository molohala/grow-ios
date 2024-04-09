import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .GithubSetting,
    targets: [
        .feature(target: .GithubSetting, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .GithubSetting)
        ]),
        .featureInterface(target: .GithubSetting, dependencies: [])
    ]
)
