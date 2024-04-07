import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .RootFeature,
    targets: [
        .makeFeature(target: .RootFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .RootFeature),
            .interface(target: .SignInFeature)
        ]),
        .makeInterface(target: .RootFeature, dependencies: []),
        .makeFeatureExample(target: .RootFeature, dependencies: [
            .feature(target: .RootFeature)
        ])
    ]
)
