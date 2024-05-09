import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Language,
    targets: [
        .service(target: .Language, dependencies: [
            .service(target: .Base),
            .serviceInterface(target: .Language)
        ]),
        .serviceInterface(target: .Language, dependencies: [
            .service(target: .Base)
        ]),
        .serviceTesting(target: .Language, dependencies: [
            .service(target: .Language)
        ])
    ]
)
