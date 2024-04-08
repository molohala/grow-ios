import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .GithubSetting,
    targets: [
        .makeFeature(target: .GithubSetting, dependencies: [
            .feature(target: .Base),
            .interface(target: .GithubSetting)
        ]),
        .makeInterface(target: .GithubSetting, dependencies: []),
        .makeFeatureExample(target: .GithubSetting, dependencies: [
            .feature(target: .GithubSetting)
        ])
    ]
)
