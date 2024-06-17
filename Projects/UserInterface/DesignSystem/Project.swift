import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeUserInterface(
    target: .DesignSystem,
    targets: [
        .userInterface(target: .DesignSystem, dependencies: [
            .shared(target: .DateUtil),
            .shared(target: .SwiftUtil),
            .SPM.Pow,
//            .SPM.Nuke,
//            .SPM.NukeUI,
            .SPM.Flow,
            .SPM.MyDesignSystem
        ] + ModulePaths.Service.allCases.map { TargetDependency.serviceInterface(target: $0) }),
        .userInterfaceExample(target: .DesignSystem, dependencies: [
            .userInterface(target: .DesignSystem)
        ])
    ]
)
