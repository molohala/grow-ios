import SwiftUI
import SettingFeatureInterface
import ProfileFeatureInterface
import ProfileEditFeatureInterface

public struct ProfileCoordinator: View {
    
    private let settingBuildable: any SettingBuildable
    private let profileEditBuildable: any ProfileEditBuildable
    private let viewModel: ProfileViewModel
    
    public init(
        settingBuildable: any SettingBuildable,
        profileEditBuildable: any ProfileEditBuildable,
        viewModel: ProfileViewModel
    ) {
        self.settingBuildable = settingBuildable
        self.profileEditBuildable = profileEditBuildable
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ProfileView(
            viewModel: viewModel
        )
        .navigationDestination(for: ProfileDestination.self) {
            switch $0 {
            case .setting: settingBuildable.makeView().eraseToAnyView()
            case .profileEdit: profileEditBuildable.makeView().eraseToAnyView()
            }
        }
    }
}
