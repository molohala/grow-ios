import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Community,
    targets: [
        .service(target: .Community, dependencies: [
            .service(target: .Base),
            .serviceInterface(target: .Community)
        ]),
        .serviceInterface(target: .Community, dependencies: [
            .service(target: .Base)
        ])
    ]
)
