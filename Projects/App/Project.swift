//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 1/4/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin
import EnvironmentPlugin

let project = Project.makeApp(
    targets: [
        .app(
            target: .iOS,
            deploymentTargets: .iOS("16.4"),
            dependenceis: [.SPM.FirebaseAnalytics, .SPM.FirebaseCrashlytics, .SPM.FirebaseMessaging, .project(target: "DI", path: .relativeToRoot("Projects/DI"))],
            infoPlist: .file(path: "\(env.name)-iOS/Support/Info.plist"),
            entitlements: .file(path: "\(env.name)-iOS/Support/App.entitlements")
        ),
        .app(
            target: .macOS,
            deploymentTargets: .macOS("13.0"),
            dependenceis: [.project(target: "DI", path: .relativeToRoot("Projects/DI"))],
            infoPlist: .file(path: "\(env.name)-macOS/Support/Info.plist")
        )
    ]
)
