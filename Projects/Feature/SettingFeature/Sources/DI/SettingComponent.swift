import Foundation
import SwiftUI
import NeedleFoundation
import SettingFeatureInterface
import ProfileEditFeatureInterface
import GithubSettingFeatureInterface
import BaekjoonSettingFeatureInterface

public protocol SettingDependency: Dependency {
    var profileEditBuildable: any ProfileEditBuildable { get }
    var githubSettingBuildable: any GithubSettingBuildable { get }
    var baekjoonSettingBuildable: any BaekjoonSettingBuildable { get }
}

public final class SettingComponent: Component<SettingDependency>, SettingBuildable {
    public func makeView() -> some View {
        SettingCoordinator(
            profileEditBuildable: dependency.profileEditBuildable,
            githubSettingBuildable: dependency.githubSettingBuildable,
            baekjoonSettingBuildable: dependency.baekjoonSettingBuildable,
            viewModel: .init()
        )
    }
}
