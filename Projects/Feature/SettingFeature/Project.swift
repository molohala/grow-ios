import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .SettingFeature,
    targets: [
        .makeFeature(target: .SettingFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .SettingFeature),
            .interface(target: .ProfileEditFeature),
            .interface(target: .BaekjoonSettingFeature),
            .interface(target: .GithubSettingFeature)
        ]),
        .makeInterface(target: .SettingFeature, dependencies: []),
        .makeFeatureExample(target: .SettingFeature, dependencies: [
            .feature(target: .SettingFeature)
        ])
    ]
)
