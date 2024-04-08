import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .BaekjoonSetting,
    targets: [
        .makeFeature(target: .BaekjoonSetting, dependencies: [
            .feature(target: .Base),
            .interface(target: .BaekjoonSetting)
        ]),
        .makeInterface(target: .BaekjoonSetting, dependencies: []),
        .makeFeatureExample(target: .BaekjoonSetting, dependencies: [
            .feature(target: .BaekjoonSetting)
        ])
    ]
)
