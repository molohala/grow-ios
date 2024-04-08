import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileDetail,
    targets: [
        .feature(target: .ProfileDetail, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .ProfileDetail)
        ]),
        .featureInterface(target: .ProfileDetail, dependencies: []),
        .featureExample(target: .ProfileDetail, dependencies: [
            .feature(target: .ProfileDetail)
        ])
    ]
)
