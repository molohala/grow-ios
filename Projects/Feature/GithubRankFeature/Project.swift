import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .GithubRank,
    targets: [
        .feature(target: .GithubRank, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .GithubRank),
            .featureInterface(target: .ProfileDetail),
            .featureInterface(target: .GithubSetting),
            .serviceInterface(target: .Rank)
        ]),
        .featureInterface(target: .GithubRank, dependencies: []),
        .featureExample(target: .GithubRank, dependencies: [
            .feature(target: .GithubRank)
        ])
    ]
)
