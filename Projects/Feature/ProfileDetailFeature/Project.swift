import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileDetail,
    targets: [
        .makeFeature(target: .ProfileDetail, dependencies: [
            .feature(target: .Base),
            .interface(target: .ProfileDetail)
        ]),
        .makeInterface(target: .ProfileDetail, dependencies: []),
        .makeFeatureExample(target: .ProfileDetail, dependencies: [
            .feature(target: .ProfileDetail)
        ])
    ]
)
