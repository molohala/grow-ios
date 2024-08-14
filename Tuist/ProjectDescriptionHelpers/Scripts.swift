//
//  Scripts.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 3/23/24.
//

import Foundation
import ProjectDescription
import EnvironmentPlugin

public extension TargetScript {
    
    
    static let swiftLintScript = """
ROOT_DIR=\(ProcessInfo.processInfo.environment["TUIST_ROOT_DIR"] ?? "")

${ROOT_DIR}/swiftlint --config ${ROOT_DIR}/.swiftlint.yml

"""
    
    static func makeNeedleScript(app: ModulePaths.App) -> String {
        """
if test -d "/opt/homebrew/bin/"; then
    PATH="/opt/homebrew/bin/:${PATH}"
fi

export PATH

if which needle > /dev/null; then
    needle generate \(env.name)-\(app.rawValue)/Sources/App/NeedleGenerated.swift ../
else
    echo "warning: Needle not installed, plz run 'brew install needle'"
fi
"""
    }
    
    static let swiftLint = TargetScript.pre(
        script: swiftLintScript,
        name: "SwiftLint",
        basedOnDependencyAnalysis: false
    )
    
    static func makeNeedle(app: ModulePaths.App) -> TargetScript {
        TargetScript.pre(
            script: makeNeedleScript(app: app),
            name: "Needle"
        )
    }
}
