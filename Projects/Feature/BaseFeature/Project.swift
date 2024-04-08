import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Base,
    targets: [
        .makeFeature(target: .Base, dependencies: [
            .userInterface(target: .DesignSystem),
            .shared(target: .GlobalThirdPartyLibrary)
        ])
    ]
)
