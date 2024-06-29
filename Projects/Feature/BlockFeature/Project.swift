import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Block,
    targets: [
        .feature(target: .Block, dependencies: [
            .feature(target: .Base)
        ]),
        .featureInterface(target: .Block, dependencies: [])
    ]
)
