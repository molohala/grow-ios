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
            .service(target: .Base),
            .userInterface(target: .DesignSystem)
        ]),
        .serviceTesting(target: .Info, dependencies: [
            .service(target: .Info)
        ])
    ]
)
