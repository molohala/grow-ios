import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ExampleFeature,
    targets: [
        .makeFeature(target: .ExampleFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .ExampleFeature, dependencies: [
            .feature(target: .ExampleFeature)
        ])
    ]
)
