import Foundation
import SwiftUI
import NeedleFoundation
import SettingFeatureInterface
import ProfileEditFeatureInterface
import GithubSettingFeatureInterface
import BaekjoonSettingFeatureInterface
import AuthServiceInterface
import BlockFeatureInterface

public protocol SettingDependency: Dependency {
    var profileEditBuildable: any ProfileEditBuildable { get }
    var githubSettingBuildable: any GithubSettingBuildable { get }
    var baekjoonSettingBuildable: any BaekjoonSettingBuildable { get }
    var authDomainBuildable: any AuthDomainBuildable { get }
    var blockBuildable: any BlockBuildable { get }
}

public final class SettingComponent: Component<SettingDependency>, SettingBuildable {
    public func makeView() -> some View {
        SettingCoordinator(
            profileEditBuildable: dependency.profileEditBuildable,
            githubSettingBuildable: dependency.githubSettingBuildable,
            baekjoonSettingBuildable: dependency.baekjoonSettingBuildable,
            blockBuildable: dependency.blockBuildable,
            viewModel: SettingViewModel(
                removeUseCase: dependency.authDomainBuildable.removeUseCase
            )
        )
    }
}
