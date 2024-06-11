import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Like,
    targets: [
        .service(target: .Like, dependencies: [
            .service(target: .Base),
            .serviceInterface(target: .Like)
        ]),
        .serviceInterface(target: .Like, dependencies: [
            .service(target: .Base)
        ]),
        .serviceTesting(target: .Like, dependencies: [
            .service(target: .Like)
        ])
    ]
)
