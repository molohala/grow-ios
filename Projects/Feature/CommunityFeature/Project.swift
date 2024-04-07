import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityFeature,
    targets: [
        .makeFeature(target: .CommunityFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .CommunityFeature)
        ]),
        .makeInterface(target: .CommunityFeature, dependencies: []),
        .makeFeatureExample(target: .CommunityFeature, dependencies: [
            .feature(target: .CommunityFeature)
        ])
    ]
)
