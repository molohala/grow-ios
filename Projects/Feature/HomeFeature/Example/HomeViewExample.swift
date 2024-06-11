import SwiftUI
import HomeFeature

@main
struct HomeViewExample: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                viewModel: .init(getTodayGithubRankUseCase: <#GetTodayGithubRankUseCase#>, getTodaySolvedacRankUseCase: <#GetTodaySolvedacRankUseCase#>, getBestCommunitiesUseCase: <#GetBestCommuntiesUseCase#>, patchLikeUseCase: <#PatchLikeUseCase#>, removeCommunityUseCase: <#RemoveCommunityUseCase#>)
            )
        }
    }
}
