import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .MainFeature,
    targets: [
        .makeFeature(target: .MainFeature, dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .HomeFeature),
            .feature(target: .GithubRankFeature),
            .feature(target: .BaekjoonRankFeature),
            .feature(target: .ProfileFeature),
            .feature(target: .CommunityFeature),
            .feature(target: .SettingFeature),
            .feature(target: .ProfileDetailFeature),
            .feature(target: .GithubSettingFeature),
            .feature(target: .BaekjoonSettingFeature),
            .feature(target: .ProfileEditFeature),
            .feature(target: .CommunityCreateFeature),
            .feature(target: .CommunityDetailFeature)
        ]),
        .makeFeatureExample(target: .MainFeature, dependencies: [
            .feature(target: .MainFeature)
        ])
    ]
)
