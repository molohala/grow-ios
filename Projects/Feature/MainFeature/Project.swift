import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .MainFeature,
    targets: [
        .makeFeature(target: .MainFeature, dependencies: [
            // base
            .feature(target: .BaseFeature),
            // features
            .interface(target: .HomeFeature),
            .interface(target: .GithubRankFeature),
            .interface(target: .BaekjoonRankFeature),
            .interface(target: .ProfileFeature),
            .interface(target: .CommunityFeature),
            // itself interface
            .interface(target: .MainFeature)
        ]),
        .makeInterface(target: .MainFeature, dependencies: []),
        .makeFeatureExample(target: .MainFeature, dependencies: [
            .feature(target: .MainFeature)
        ])
    ]
)
