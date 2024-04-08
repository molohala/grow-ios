import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .SignIn,
    targets: [
        .makeFeature(target: .SignIn, dependencies: [
            .feature(target: .Base),
            .service(target: .Auth),
            .interface(target: .SignIn)
        ]),
        .makeFeatureExample(target: .SignIn, dependencies: [
            .feature(target: .SignIn)
        ]),
        .makeInterface(target: .SignIn, dependencies: [])
    ]
)
