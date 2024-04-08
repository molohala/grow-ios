import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Community,
    targets: [
        .makeFeature(target: .Community, dependencies: [
            .feature(target: .Base),
            .interface(target: .Community),
            .interface(target: .CommunityDetail),
            .interface(target: .CommunityCreate)
        ]),
        .makeInterface(target: .Community, dependencies: []),
        .makeFeatureExample(target: .Community, dependencies: [
            .feature(target: .Community)
        ])
    ]
)
