import Foundation
import SwiftUI
import NeedleFoundation
import ProfileFeatureInterface
import SettingFeatureInterface
import InfoServiceInterface
import ProfileEditFeatureInterface

public protocol ProfileDependency: Dependency {
    var settingBuildable: any SettingBuildable { get }
    var infoDomainBuildable: any InfoDomainBuildable { get }
    var profileEditBuildable: any ProfileEditBuildable { get }
}

public final class ProfileComponent: Component<ProfileDependency>, ProfileBuildable {
    public func makeView() -> some View {
        ProfileCoordinator(
            settingBuildable: dependency.settingBuildable,
            profileEditBuildable: dependency.profileEditBuildable,
            viewModel: .init(
                getGithubUseCase: dependency.infoDomainBuildable.getGithubUseCase,
                getSolvedavUseCase: dependency.infoDomainBuildable.getSolvedacUseCase
            )
        )
    }
}
