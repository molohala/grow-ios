import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .RankFeature,
    targets: [
        .makeFeature(target: .RankFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .RankFeature, dependencies: [
            .feature(target: .RankFeature)
        ])
    ]
)
