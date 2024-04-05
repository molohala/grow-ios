import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .BaekjoonSettingFeature,
    targets: [
        .makeFeature(target: .BaekjoonSettingFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .BaekjoonSettingFeature, dependencies: [
            .feature(target: .BaekjoonSettingFeature)
        ])
    ]
)
