import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityEdit,
    targets: [
        .feature(target: .CommunityEdit, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .CommunityEdit),
        ]),
        .featureInterface(target: .CommunityEdit, dependencies: [
            .serviceInterface(target: .Community)
        ])
    ]
)
