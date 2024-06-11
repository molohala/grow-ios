import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityCreate,
    targets: [
        .feature(target: .CommunityCreate, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .CommunityCreate),
            .serviceInterface(target: .Community)
        ]),
        .featureInterface(target: .CommunityCreate, dependencies: [])
    ]
)
