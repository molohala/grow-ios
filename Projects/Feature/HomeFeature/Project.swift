import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Home,
    targets: [
        .feature(target: .Home, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .Home),
            .featureInterface(target: .CommunityDetail),
            .featureInterface(target: .ProfileDetail),
            .featureInterface(target: .Community),
            .featureInterface(target: .CommunityEdit),
            .featureInterface(target: .Profile),
            .featureInterface(target: .CommunityCreate)
        ]),
        .featureInterface(target: .Home, dependencies: []),
        .featureExample(target: .Home, dependencies: [
            .feature(target: .Home)
        ])
    ]
)
