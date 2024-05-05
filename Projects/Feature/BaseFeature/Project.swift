import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Base,
    targets: [
        .feature(target: .Base, product: .framework, dependencies: [
            .userInterface(target: .DesignSystem),
            .shared(target: .GlobalThirdPartyLibrary),
            .shared(target: .DateUtil),
            .serviceInterface(target: .Auth),
            .serviceInterface(target: .Info),
            .shared(target: .SwiftUtil),
        ]),
        .featureInterface(target: .Base, dependencies: [])
    ]
)
