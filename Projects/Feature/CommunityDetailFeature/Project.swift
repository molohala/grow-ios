import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityDetailFeature,
    targets: [
        .makeFeature(target: .CommunityDetailFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .CommunityDetailFeature)
        ]),
        .makeInterface(target: .CommunityDetailFeature, dependencies: []),
        .makeFeatureExample(target: .CommunityDetailFeature, dependencies: [
            .feature(target: .CommunityDetailFeature)
        ])
    ]
)
