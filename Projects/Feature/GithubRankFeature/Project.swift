import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .GithubRank,
    targets: [
        .makeFeature(target: .GithubRank, dependencies: [
            .feature(target: .Base),
            .interface(target: .GithubRank),
            .interface(target: .ProfileDetail),
            .interface(target: .GithubSetting)
        ]),
        .makeInterface(target: .GithubRank, dependencies: []),
        .makeFeatureExample(target: .GithubRank, dependencies: [
            .feature(target: .GithubRank)
        ])
    ]
)
