import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .BaekjoonRank,
    targets: [
        .makeFeature(target: .BaekjoonRank, dependencies: [
            .feature(target: .Base),
            .interface(target: .BaekjoonRank),
            .interface(target: .ProfileDetail)
        ]),
        .makeInterface(target: .BaekjoonRank, dependencies: []),
        .makeFeatureExample(target: .BaekjoonRank, dependencies: [
            .feature(target: .BaekjoonRank)
        ])
    ]
)
