import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .SignInFeature,
    targets: [
        .makeFeature(target: .SignInFeature, dependencies: [
            .feature(target: .BaseFeature),
            .service(target: .AuthService),
            .interface(target: .SignInFeature)
        ]),
        .makeFeatureExample(target: .SignInFeature, dependencies: [
            .feature(target: .SignInFeature)
        ]),
        .makeInterface(target: .SignInFeature, dependencies: [])
    ]
)
