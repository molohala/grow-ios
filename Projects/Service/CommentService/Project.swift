import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Comment,
    targets: [
        .service(target: .Comment, dependencies: [
            .service(target: .Base),
            .serviceInterface(target: .Comment)
        ]),
        .serviceInterface(target: .Comment, dependencies: [
            .service(target: .Base)
        ]),
        .serviceTesting(target: .Comment, dependencies: [
            .service(target: .Comment)
        ])
    ]
)
