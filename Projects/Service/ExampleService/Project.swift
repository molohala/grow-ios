import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeService(
    target: .ExampleService,
    targets: [
        .makeService(target: .ExampleService, dependencies: [
            .service(target: .BaseService)
        ])
    ]
)
