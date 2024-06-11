import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileEdit,
    targets: [
        .feature(target: .ProfileEdit, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .ProfileEdit),
            .serviceInterface(target: .Info),
            .serviceInterface(target: .Language)
        ]),
        .featureInterface(target: .ProfileEdit, dependencies: [])
    ]
)
