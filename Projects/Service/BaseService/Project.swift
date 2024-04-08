import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Base,
    targets: [
        .makeService(target: .Base, dependencies: [
            .shared(target: .GlobalThirdPartyLibrary)
        ])
    ]
)
