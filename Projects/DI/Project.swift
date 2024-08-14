//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by hhhello0507 on 8/14/24.
//

import Foundation
import ProjectDescription
import EnvironmentPlugin
import ProjectDescriptionHelpers

let project = Project.makeProject(
    name: "DI",
    targets: [
        .init(
            name: "DI",
            destinations: env.destinations,
            product: .staticFramework,
            bundleId: "us.growapp.di",
            deploymentTargets: env.deploymentTargets,
            sources: ["Sources/**"],
            dependencies: ModulePaths.Feature.allCases.map { TargetDependency.feature(target: $0) }
            + ModulePaths.Service.allCases.map { TargetDependency.service(target: $0) }
        )
    ]
)
