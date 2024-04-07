import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .MainFeature,
    targets: [
        .makeFeature(target: .MainFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .HomeFeature),
            .interface(target: .GithubRankFeature),
            .interface(target: .BaekjoonRankFeature),
            .interface(target: .ProfileFeature),
            .interface(target: .CommunityFeature),
            .interface(target: .SettingFeature),
            .interface(target: .ProfileDetailFeature),
            .interface(target: .GithubSettingFeature),
            .interface(target: .BaekjoonSettingFeature),
            .interface(target: .ProfileEditFeature),
            .interface(target: .CommunityCreateFeature),
            .interface(target: .CommunityDetailFeature)
        ]),
        .makeInterface(target: .MainFeature, dependencies: []),
        .makeFeatureExample(target: .MainFeature, dependencies: [
            .feature(target: .MainFeature)
        ])
    ]
)
