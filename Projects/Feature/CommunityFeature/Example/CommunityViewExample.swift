import SwiftUI
import CommunityFeature
import CommunityServiceTesting
import LikeServiceTesting

@main
struct CommunityViewExample: App {
    
    @ObservedObject var viewModel = CommunityViewModel(
        getCommunitesUseCase: GetCommunitiesUseCaseSpy(),
        patchLikeUseCase: PatchLikeUseCaseSpy()
    )
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                CommunityView(
                    viewModel: viewModel
                )
                VStack {
                    Spacer()
                    Button {
                        Task {
                            await viewModel.fetchCommunities()
                        }
                    } label: {
                        Text("reload")
                            .padding()
                            .foregroundStyle(.white)
                            .background(.blue)
                    }
                    .padding(.bottom, 24)
                }
            }
        }
    }
}
