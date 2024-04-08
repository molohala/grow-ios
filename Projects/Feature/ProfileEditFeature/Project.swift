import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileEdit,
    targets: [
        .makeFeature(target: .ProfileEdit, dependencies: [
            .feature(target: .Base),
            .interface(target: .ProfileEdit)
        ]),
        .makeInterface(target: .ProfileEdit, dependencies: []),
        .makeFeatureExample(target: .ProfileEdit, dependencies: [
            .feature(target: .ProfileEdit)
        ])
    ]
)
