import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Rank,
    targets: [
        .service(target: .Rank, dependencies: [
            .service(target: .Base),
            .serviceInterface(target: .Rank)
        ]),
        .serviceInterface(target: .Rank, dependencies: [
            .service(target: .Base)
        ]),
        .serviceTesting(target: .Rank, dependencies: [
            .service(target: .Rank)
        ])
    ]
)
