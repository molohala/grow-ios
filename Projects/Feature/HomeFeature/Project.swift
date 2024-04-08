import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Home,
    targets: [
        .makeFeature(target: .Home, dependencies: [
            .feature(target: .Base),
            .interface(target: .Home),
            .interface(target: .CommunityDetail),
            .interface(target: .ProfileDetail)
        ]),
        .makeInterface(target: .Home, dependencies: []),
        .makeFeatureExample(target: .Home, dependencies: [
            .feature(target: .Home)
        ])
    ]
)
