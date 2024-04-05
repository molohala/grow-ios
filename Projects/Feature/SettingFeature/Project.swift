import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .SettingFeature,
    targets: [
        .makeFeature(target: .SettingFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .SettingFeature, dependencies: [
            .feature(target: .SettingFeature)
        ])
    ]
)
