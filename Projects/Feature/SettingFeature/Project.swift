import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Setting,
    targets: [
        .feature(target: .Setting, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .Setting),
            .featureInterface(target: .ProfileEdit),
            .featureInterface(target: .BaekjoonSetting),
            .featureInterface(target: .GithubSetting),
            .serviceInterface(target: .Auth)
        ]),
        .featureInterface(target: .Setting, dependencies: [])
    ]
)
