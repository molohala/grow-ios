import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .GithubRankFeature,
    targets: [
        .makeFeature(target: .GithubRankFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .GithubRankFeature),
            .interface(target: .ProfileDetailFeature)
        ]),
        .makeInterface(target: .GithubRankFeature, dependencies: []),
        .makeFeatureExample(target: .GithubRankFeature, dependencies: [
            .feature(target: .GithubRankFeature)
        ])
    ]
)
