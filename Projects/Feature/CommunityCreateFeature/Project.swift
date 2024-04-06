import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityCreateFeature,
    targets: [
        .makeFeature(target: .CommunityCreateFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .CommunityCreateFeature, dependencies: [
            .feature(target: .CommunityCreateFeature)
        ])
    ]
)
