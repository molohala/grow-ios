import CommunityDetailFeature
import SwiftUI
import CommunityServiceInterface
import CommunityServiceTesting

@main
struct CommunityDetailViewExample: App {
    var body: some Scene {
        WindowGroup {
            CommunityDetailView(
                viewModel: .init(
                    getCommunityUseCase: GetCommunityUseCaseSpy()
                ),
                id: -1
            )
        }
    }
}
