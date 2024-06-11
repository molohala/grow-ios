//
//  Scripts.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 3/23/24.
//

import Foundation
import ProjectDescription

public extension TargetScript {
    
    
    static let swiftLintScript = """
ROOT_DIR=\(ProcessInfo.processInfo.environment["TUIST_ROOT_DIR"] ?? "")

${ROOT_DIR}/swiftlint --config ${ROOT_DIR}/.swiftlint.yml

"""
    
    static let needleScript = """
if test -d "/opt/homebrew/bin/"; then
    PATH="/opt/homebrew/bin/:${PATH}"
fi

export PATH

if which needle > /dev/null; then
    needle generate Sources/App/NeedleGenerated.swift ../
else
    echo "warning: Needle not installed, plz run 'brew install needle'"
fi
"""
    
    static let swiftLint = TargetScript.pre(
        script: swiftLintScript,
        name: "SwiftLint",
        basedOnDependencyAnalysis: false
    )
    
    static let needle = TargetScript.pre(
        script: needleScript,
        name: "Needle"
    )
}
