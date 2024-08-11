import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .Notification,
    targets: [
        .service(target: .Notification, dependencies: [
            .serviceInterface(target: .Notification)
        ]),
        .serviceInterface(target: .Notification, dependencies: [
            .service(target: .Base)
        ]),
        .serviceTesting(target: .Notification, dependencies: [
            .service(target: .Notification)
        ])
    ]
)
