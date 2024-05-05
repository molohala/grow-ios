import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeUserInterface(
    target: .DesignSystem,
    targets: [
        .userInterface(target: .DesignSystem, dependencies: [
            .shared(target: .DateUtil),
            .shared(target: .SwiftUtil),
            .SPM.Pow
        ] + ModulePaths.Service.allCases.map { TargetDependency.service(target: $0) }),
        .userInterfaceExample(target: .DesignSystem, dependencies: [
            .userInterface(target: .DesignSystem)
        ])
    ]
)
