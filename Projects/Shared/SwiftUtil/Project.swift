import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeShared(
    target: .SwiftUtil,
    targets: [
        .shared(target: .SwiftUtil, dependencies: [])
    ]
)
