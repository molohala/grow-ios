import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityCreate,
    targets: [
        .makeFeature(target: .CommunityCreate, dependencies: [
            .feature(target: .Base),
            .interface(target: .CommunityCreate)
        ]),
        .makeInterface(target: .CommunityCreate, dependencies: []),
        .makeFeatureExample(target: .CommunityCreate, dependencies: [
            .feature(target: .CommunityCreate)
        ])
    ]
)
