import Foundation
import ProjectDescription

public struct ProjectEnvironment {
    public let name: String
    public let organizationName: String
    public let destinations: Destinations
    public let deploymentTargets: DeploymentTargets
}

public let env = ProjectEnvironment(
    name: "Grow",
    organizationName: "molohala",
    destinations: [.iPhone, .mac],
    deploymentTargets: .init(iOS: "16.4", macOS: "13.0")
)
