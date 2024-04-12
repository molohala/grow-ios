import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .SignIn,
    targets: [
        .feature(target: .SignIn, dependencies: [
            .feature(target: .Base),
            .serviceInterface(target: .Auth),
            .featureInterface(target: .SignIn),
            .serviceInterface(target: .Auth)
        ]),
        .featureExample(target: .SignIn, dependencies: [
            .feature(target: .SignIn)
        ]),
        .featureInterface(target: .SignIn, dependencies: [])
    ]
)
