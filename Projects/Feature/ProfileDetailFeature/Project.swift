import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileDetailFeature,
    targets: [
        .makeFeature(target: .ProfileDetailFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .ProfileDetailFeature)
        ]),
        .makeInterface(target: .ProfileDetailFeature, dependencies: []),
        .makeFeatureExample(target: .ProfileDetailFeature, dependencies: [
            .feature(target: .ProfileDetailFeature)
        ])
    ]
)
