import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Main,
    targets: [
        .makeFeature(target: .Main, dependencies: [
            // base
            .feature(target: .Base),
            // features
            .interface(target: .Home),
            .interface(target: .GithubRank),
            .interface(target: .BaekjoonRank),
            .interface(target: .Profile),
            .interface(target: .Community),
            // itself interface
            .interface(target: .Main)
        ]),
        .makeInterface(target: .Main, dependencies: []),
        .makeFeatureExample(target: .Main, dependencies: [
            .feature(target: .Main)
        ])
    ]
)
