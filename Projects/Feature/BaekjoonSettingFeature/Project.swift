import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .BaekjoonSetting,
    targets: [
        .feature(target: .BaekjoonSetting, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .BaekjoonSetting),
            .serviceInterface(target: .Info)
        ]),
        .featureInterface(target: .BaekjoonSetting, dependencies: [])
    ]
)
