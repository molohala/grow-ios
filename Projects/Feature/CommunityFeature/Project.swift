import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Community,
    targets: [
        .feature(target: .Community, dependencies: [
            .featureInterface(target: .Community),
            .featureInterface(target: .CommunityDetail),
            .featureInterface(target: .CommunityCreate),
            .featureInterface(target: .CommunityEdit),
            .serviceInterface(target: .Community),
            .serviceInterface(target: .Like),
            .featureInterface(target: .CommunityEdit),
            .feature(target: .Base)
        ]),
        .featureInterface(target: .Community, dependencies: []),
        .featureExample(target: .Community, dependencies: [
            .feature(target: .Community),
            .serviceTesting(target: .Community),
            .serviceTesting(target: .Like)
        ])
    ]
)
