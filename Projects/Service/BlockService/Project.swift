import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Block,
    targets: [
        .service(target: .Block, dependencies: [
            .service(target: .Base),
            .serviceInterface(target: .Block)
        ]),
        .serviceInterface(target: .Block, dependencies: [
            .service(target: .Base)
        ])
    ]
)
