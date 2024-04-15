import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityDetail,
    targets: [
        .feature(target: .CommunityDetail, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .CommunityDetail),
            .featureInterface(target: .ProfileDetail),
            .serviceInterface(target: .Community),
            .serviceInterface(target: .Like),
        ]),
        .featureInterface(target: .CommunityDetail, dependencies: []),
        .featureExample(target: .CommunityDetail, dependencies: [
            .feature(target: .CommunityDetail),
            .serviceTesting(target: .Community),
            .serviceTesting(target: .Like)
        ])
    ]
)
