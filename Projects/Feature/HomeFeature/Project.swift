import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Home,
    targets: [
        .feature(target: .Home, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .Home),
            .featureInterface(target: .CommunityDetail),
            .featureInterface(target: .ProfileDetail),
            .featureInterface(target: .Community),
        ]),
        .featureInterface(target: .Home, dependencies: [
            .serviceInterface(target: .Community),
            .serviceInterface(target: .Like),
            .serviceInterface(target: .Rank)
        ]),
        .featureExample(target: .Home, dependencies: [
            .feature(target: .Home)
        ])
    ]
)
