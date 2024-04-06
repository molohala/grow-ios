import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityDetailFeature,
    targets: [
        .makeFeature(target: .CommunityDetailFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .CommunityDetailFeature, dependencies: [
            .feature(target: .CommunityDetailFeature)
        ])
    ]
)
