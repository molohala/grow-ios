//
//  Project+.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 3/29/24.
//

import ProjectDescription
import EnvironmentPlugin

public extension Project {
    static func makeApp(
        packages: [Package] = [],
        targets: [Target] = []
    ) -> Self {
        .makeProject(
            name: env.name,
            packages: packages,
            targets: targets
        )
    }
    
    static func makeFeature(
        target: ModulePaths.Feature,
        packages: [Package] = [],
        targets: [Target] = []
    ) -> Self {
        .makeProject(name: "\(target.rawValue)Feature",
                    targets: targets)
    }
    
    static func makeService(
        target: ModulePaths.Service,
        packages: [Package] = [],
        targets: [Target] = []
    ) -> Self {
        .makeProject(name: "\(target.rawValue)Service",
                    targets: targets)
    }
    
    static func makeShared(
        target: ModulePaths.Shared,
        packages: [Package] = [],
        targets: [Target]
    ) -> Self {
        .makeProject(name: target.rawValue,
                    targets: targets)
    }
    
    static func makeUserInterface(
        target: ModulePaths.UserInterface,
        packages: [Package] = [],
        targets: [Target] = []
    ) -> Self {
        .makeProject(name: target.rawValue,
                    targets: targets)
    }
}
