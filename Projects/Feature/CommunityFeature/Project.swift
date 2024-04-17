import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Community,
    targets: [
        .feature(target: .Community, dependencies: [
            .featureInterface(target: .Community),
            .featureInterface(target: .CommunityDetail),
            .featureInterface(target: .CommunityCreate),
            .serviceInterface(target: .Community),
            .serviceInterface(target: .Like),
            .featureInterface(target: .CommunityEdit)
        ]),
        .featureInterface(target: .Community, dependencies: [
            .serviceInterface(target: .Community),
            .feature(target: .Base)
        ]),
        .featureExample(target: .Community, dependencies: [
            .feature(target: .Community),
            .serviceTesting(target: .Community),
            .serviceTesting(target: .Like)
        ])
    ]
)
