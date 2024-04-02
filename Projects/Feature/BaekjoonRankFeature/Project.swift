import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .BaekjoonRankFeature,
    targets: [
        .makeFeature(target: .BaekjoonRankFeature, dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .makeFeatureExample(target: .BaekjoonRankFeature, dependencies: [
            .feature(target: .BaekjoonRankFeature)
        ])
    ]
)
