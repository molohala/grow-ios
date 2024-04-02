import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileFeature,
    targets: [
        .makeFeature(target: .ProfileFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .ProfileFeature, dependencies: [
            .feature(target: .ProfileFeature)
        ])
    ]
)
