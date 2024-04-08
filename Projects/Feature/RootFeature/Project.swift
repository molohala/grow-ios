import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .RootFeature,
    targets: [
        .makeFeature(target: .RootFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .SignInFeature),
            .interface(target: .MainFeature)
        ]),
        .makeFeatureExample(target: .RootFeature, dependencies: [
            .feature(target: .RootFeature)
        ])
    ]
)
