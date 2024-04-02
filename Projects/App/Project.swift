//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 1/4/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeApp(
    target: .App,
    targets: [
        .makeApp(target: .App, dependenceis: [
            .feature(target: .SignInFeature),
            .feature(target: .HomeFeature),
            .feature(target: .ProfileFeature),
            .feature(target: .RankFeature)
        ], infoPlist: .file(path: "Support/Info.plist"))
    ]
)
