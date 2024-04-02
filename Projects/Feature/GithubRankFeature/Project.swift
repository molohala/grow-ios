import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .GithubRankFeature,
    targets: [
        .makeFeature(target: .GithubRankFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .GithubRankFeature, dependencies: [
            .feature(target: .GithubRankFeature)
        ])
    ]
)
