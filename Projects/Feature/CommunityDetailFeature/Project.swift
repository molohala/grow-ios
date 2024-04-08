import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityDetail,
    targets: [
        .makeFeature(target: .CommunityDetail, dependencies: [
            .feature(target: .Base),
            .interface(target: .CommunityDetail),
            .interface(target: .ProfileDetail)
        ]),
        .makeInterface(target: .CommunityDetail, dependencies: []),
        .makeFeatureExample(target: .CommunityDetail, dependencies: [
            .feature(target: .CommunityDetail)
        ])
    ]
)
