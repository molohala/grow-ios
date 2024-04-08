//
//  TargetDependency+Target.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 3/26/24.
//

import ProjectDescription

public extension TargetDependency {
    static func feature(
        target: ModulePaths.Feature
    ) -> TargetDependency {
        .project(target: "\(target.rawValue)Feature",
                 path: .relativeToFeature("\(target.rawValue)Feature"))
    }
    
    static func interface(
        target: ModulePaths.Feature
    ) -> TargetDependency {
        .project(target: "\(target.rawValue)Interface",
                 path: .relativeToFeature("\(target.rawValue)Interface"))
    }
    
    static func service(
        target: ModulePaths.Service
    ) -> TargetDependency {
        .project(target: "\(target.rawValue)Service",
                 path: .relativeToSerivce("\(target.rawValue)Service"))
    }
    
    static func userInterface(
        target: ModulePaths.UserInterface
    ) -> TargetDependency {
        .project(target: target.rawValue,
                 path: .relativeToUserInterface(target.rawValue))
    }
    
    static func shared(
        target: ModulePaths.Shared
    ) -> TargetDependency {
        .project(target: target.rawValue,
                 path: .relativeToShared(target.rawValue))
    }
}
