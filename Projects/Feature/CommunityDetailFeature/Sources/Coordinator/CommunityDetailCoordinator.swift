import SwiftUI
import CommunityEditFeatureInterface

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
                case .communityEdit(communityContent: let communityContent): communityEditBuildable.makeView(communityContent: communityContent).eraseToAnyView()
                }
            }
    }
}
