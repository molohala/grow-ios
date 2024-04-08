import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Setting,
    targets: [
        .makeFeature(target: .Setting, dependencies: [
            .feature(target: .Base),
            .interface(target: .Setting),
            .interface(target: .ProfileEdit),
            .interface(target: .BaekjoonSetting),
            .interface(target: .GithubSetting)
        ]),
        .makeInterface(target: .Setting, dependencies: []),
        .makeFeatureExample(target: .Setting, dependencies: [
            .feature(target: .Setting)
        ])
    ]
)
