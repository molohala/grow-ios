import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Auth,
    targets: [
        .service(target: .Auth, dependencies: [
            .service(target: .Base),
            .serviceInterface(target: .Auth)
        ]),
        .serviceInterface(target: .Auth, dependencies: [
            .service(target: .Base)
        ])
    ]
)
