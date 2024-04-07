import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .BaekjoonSettingFeature,
    targets: [
        .makeFeature(target: .BaekjoonSettingFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .BaekjoonSettingFeature)
        ]),
        .makeInterface(target: .BaekjoonSettingFeature, dependencies: []),
        .makeFeatureExample(target: .BaekjoonSettingFeature, dependencies: [
            .feature(target: .BaekjoonSettingFeature)
        ])
    ]
)
