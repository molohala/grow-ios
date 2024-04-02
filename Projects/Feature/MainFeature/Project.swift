import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .MainFeature,
    targets: [
        .makeFeature(target: .MainFeature, dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .HomeFeature),
            .feature(target: .RankFeature),
            .feature(target: .ProfileFeature)
        ]),
        .makeFeatureExample(target: .MainFeature, dependencies: [
            .feature(target: .MainFeature)
        ])
    ]
)
