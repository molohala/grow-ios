import SwiftUI
import CommunityFeature
import CommunityServiceTesting
import LikeServiceTesting

@main
struct CommunityViewExample: App {
    var body: some Scene {
        WindowGroup {
            CommunityView(
                viewModel: .init(
                    getCommunitesUseCase: GetCommunitiesUseCaseSpy(),
                    patchLikeUseCase: PatchLikeUseCaseSpy()
                )
            )
        }
    }
}
