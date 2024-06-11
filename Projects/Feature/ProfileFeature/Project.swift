import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Profile,
    targets: [
        .feature(target: .Profile, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .Profile),
            .featureInterface(target: .Setting),
            .serviceInterface(target: .Info),
            .featureInterface(target: .ProfileEdit)
        ]),
        .featureInterface(target: .Profile, dependencies: []),
        .featureExample(target: .Profile, dependencies: [
            .feature(target: .Profile)
        ])
    ]
)
