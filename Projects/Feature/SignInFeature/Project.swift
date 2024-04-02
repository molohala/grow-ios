import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .SignInFeature,
    targets: [
        .makeFeature(target: .SignInFeature, dependencies: [
            .feature(target: .BaseFeature),
            .service(target: .AuthService)
        ]),
        .makeFeatureExample(target: .SignInFeature, dependencies: [
            .feature(target: .SignInFeature)
        ])
    ]
)
