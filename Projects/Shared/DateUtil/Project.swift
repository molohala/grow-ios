import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeShared(
    target: .DateUtil,
    targets: [
        .shared(target: .DateUtil, dependencies: [])
    ]
)
