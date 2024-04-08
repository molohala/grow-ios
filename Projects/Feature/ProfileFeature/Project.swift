import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Profile,
    targets: [
        .makeFeature(target: .Profile, dependencies: [
            .feature(target: .Base),
            .interface(target: .Profile),
            .interface(target: .Setting)
        ]),
        .makeInterface(target: .Profile, dependencies: []),
        .makeFeatureExample(target: .Profile, dependencies: [
            .feature(target: .Profile)
        ])
    ]
)
