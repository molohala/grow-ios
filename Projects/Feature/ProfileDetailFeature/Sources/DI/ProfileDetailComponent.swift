import Foundation
import SwiftUI
import NeedleFoundation
import ProfileDetailFeatureInterface
import InfoServiceInterface

public protocol ProfileDetailDependency: Dependency {
    var infoDomainBuildable: any InfoDomainBuildable { get }
}

public final class ProfileDetailComponent: Component<ProfileDetailDependency>, ProfileDetailBuildable {
    public func makeView(memberId: Int) -> some View {
        ProfileDetailView(
            viewModel: .init(
                getGithubUseCase: dependency.infoDomainBuildable.getGithubUseCase,
                getProfileUseCase: dependency.infoDomainBuildable.getProfileUseCase,
                getSolvedacUseCase: dependency.infoDomainBuildable.getSolvedacUseCase,
                memberId: memberId
            )
        )
    }
}
