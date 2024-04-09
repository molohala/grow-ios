import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Base,
    targets: [
        .service(target: .Base, product: .framework, dependencies: [
            .shared(target: .GlobalThirdPartyLibrary)
        ])
    ]
)
