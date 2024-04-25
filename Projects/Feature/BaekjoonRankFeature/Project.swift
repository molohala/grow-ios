import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .BaekjoonRank,
    targets: [
        .feature(target: .BaekjoonRank, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .BaekjoonRank),
            .featureInterface(target: .ProfileDetail),
            .serviceInterface(target: .Rank)
        ]),
        .featureInterface(target: .BaekjoonRank, dependencies: []),
        .featureExample(target: .BaekjoonRank, dependencies: [
            .feature(target: .BaekjoonRank)
        ])
    ]
)
