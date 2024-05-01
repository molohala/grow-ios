import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileDetail,
    targets: [
        .feature(target: .ProfileDetail, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .ProfileDetail),
            .serviceInterface(target: .Info),
        ]),
        .featureInterface(target: .ProfileDetail, dependencies: [])
    ]
)
