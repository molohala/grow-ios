import Foundation
import SwiftUI
import NeedleFoundation
import GithubSettingFeatureInterface
import InfoServiceInterface

public protocol GithubSettingDependency: Dependency {
    var infoDomainBuildable: any InfoDomainBuildable { get }
}

public final class GithubSettingComponent: Component<GithubSettingDependency>, GithubSettingBuildable {
    public func makeView(_ githubId: String) -> some View {
        GithubSettingView(
            viewModel: .init(
                registerGithubUseCase: dependency.infoDomainBuildable.registerGithubUseCase,
                githubId: githubId
            )
        )
    }
}
