import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityCreateFeature,
    targets: [
        .makeFeature(target: .CommunityCreateFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .CommunityCreateFeature)
        ]),
        .makeInterface(target: .CommunityCreateFeature, dependencies: []),
        .makeFeatureExample(target: .CommunityCreateFeature, dependencies: [
            .feature(target: .CommunityCreateFeature)
        ])
    ]
)
