import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

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
            .serviceInterface(target: .Block)
        ]),
        .featureInterface(target: .Base, dependencies: [])
    ]
)
