import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityDetail,
    targets: [
        .feature(target: .CommunityDetail, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .CommunityDetail),
            .featureInterface(target: .ProfileDetail)
        ]),
        .featureInterface(target: .CommunityDetail, dependencies: []),
        .featureExample(target: .CommunityDetail, dependencies: [
            .feature(target: .CommunityDetail)
        ])
    ]
)
