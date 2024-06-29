import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Main,
    targets: [
        .feature(target: .Main, dependencies: [
            // base
            .feature(target: .Base),
            // features
            .featureInterface(target: .Home),
            .featureInterface(target: .GithubRank),
            .featureInterface(target: .BaekjoonRank),
            .featureInterface(target: .Profile),
            .featureInterface(target: .Community),
            // itself interface
            .featureInterface(target: .Main),
            .serviceInterface(target: .Block)
        ]),
        .featureInterface(target: .Main, dependencies: []),
        .featureExample(target: .Main, dependencies: [
            .feature(target: .Main)
        ])
    ]
)
