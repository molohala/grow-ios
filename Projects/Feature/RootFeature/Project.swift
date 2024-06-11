import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Root,
    targets: [
        .feature(target: .Root, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .SignIn),
            .featureInterface(target: .Main),
            .serviceInterface(target: .Auth),
            .serviceInterface(target: .Info)
        ])
    ]
)
