import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Info,
    targets: [
        .service(target: .Info, dependencies: [
            .service(target: .Base),
            .serviceInterface(target: .Info)
        ]),
        .serviceInterface(target: .Info, dependencies: [
            .service(target: .Base)
        ]),
        .serviceTesting(target: .Info, dependencies: [
            .service(target: .Info)
        ])
    ]
)
