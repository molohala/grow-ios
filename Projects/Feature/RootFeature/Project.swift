import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Root,
    targets: [
        .makeFeature(target: .Root, dependencies: [
            .feature(target: .Base),
            .interface(target: .SignIn),
            .interface(target: .Main)
        ]),
        .makeFeatureExample(target: .Root, dependencies: [
            .feature(target: .Root)
        ])
    ]
)
