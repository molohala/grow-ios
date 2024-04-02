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
            .feature(target: .CommunityFeature)
        ]),
        .makeFeatureExample(target: .MainFeature, dependencies: [
            .feature(target: .MainFeature)
        ])
    ]
)
