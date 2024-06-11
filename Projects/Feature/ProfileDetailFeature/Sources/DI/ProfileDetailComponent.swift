import Foundation
import SwiftUI
import NeedleFoundation
import ProfileDetailFeatureInterface
import InfoServiceInterface
import LanguageServiceInterface

public protocol ProfileDetailDependency: Dependency {
    var infoDomainBuildable: any InfoDomainBuildable { get }
    var languageDomainBuildable: any LanguageDomainBuildable { get }
}

public final class ProfileDetailComponent: Component<ProfileDetailDependency>, ProfileDetailBuildable {
    public func makeView(memberId: Int) -> some View {
        ProfileDetailView(
            viewModel: .init(
                getGithubUseCase: dependency.infoDomainBuildable.getGithubUseCase,
                getProfileByIdUseCase: dependency.infoDomainBuildable.getProfileByIdUseCase,
                getSolvedacUseCase: dependency.infoDomainBuildable.getSolvedacUseCase,
                getLanguagesByMemberIdUseCase: dependency.languageDomainBuildable.getLanguagesByMemberIdUseCase,
                memberId: memberId
            )
        )
    }
}
