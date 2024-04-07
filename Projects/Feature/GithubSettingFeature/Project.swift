import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .GithubSettingFeature,
    targets: [
        .makeFeature(target: .GithubSettingFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .GithubSettingFeature)
        ]),
        .makeInterface(target: .GithubSettingFeature, dependencies: []),
        .makeFeatureExample(target: .GithubSettingFeature, dependencies: [
            .feature(target: .GithubSettingFeature)
        ])
    ]
)
