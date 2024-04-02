import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileEditFeature,
    targets: [
        .makeFeature(target: .ProfileEditFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .ProfileEditFeature, dependencies: [
            .feature(target: .ProfileEditFeature)
        ])
    ]
)
