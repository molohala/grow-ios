import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileEditFeature,
    targets: [
        .makeFeature(target: .ProfileEditFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .ProfileEditFeature)
        ]),
        .makeInterface(target: .ProfileEditFeature, dependencies: []),
        .makeFeatureExample(target: .ProfileEditFeature, dependencies: [
            .feature(target: .ProfileEditFeature)
        ])
    ]
)
