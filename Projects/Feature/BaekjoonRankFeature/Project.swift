import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .BaekjoonRankFeature,
    targets: [
        .makeFeature(target: .BaekjoonRankFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .BaekjoonRankFeature)
        ]),
        .makeInterface(target: .BaekjoonRankFeature, dependencies: []),
        .makeFeatureExample(target: .BaekjoonRankFeature, dependencies: [
            .feature(target: .BaekjoonRankFeature)
        ])
    ]
)
