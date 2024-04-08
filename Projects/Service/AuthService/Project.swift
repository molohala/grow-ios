import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Auth,
    targets: [
        .makeService(target: .Auth, dependencies: [
            .service(target: .Base)
        ])
    ]
)
