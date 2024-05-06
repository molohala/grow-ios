import SwiftUI
import CommunityEditFeatureInterface
import BaseFeature

struct CommunityDetailCoordinator: View {
    
    private let viewModel: CommunityDetailViewModel
    private let communityEditBuildable: any CommunityEditBuildable
    
    init(
        viewModel: CommunityDetailViewModel,
        communityEditBuildable: any CommunityEditBuildable
    ) {
        self.viewModel = viewModel
        self.communityEditBuildable = communityEditBuildable
    }
    
    var body: some View {
        CommunityDetailView(viewModel: viewModel)
            .navigationDestination(for: CommunityDetailDestination.self) {
                switch $0 {
                case .communityEdit(let forumId): communityEditBuildable.makeView(forumId: forumId).eraseToAnyView()
                }
            }
    }
}
