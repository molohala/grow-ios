import SwiftUI
import DesignSystem
import BaseFeature
import HomeFeatureInterface

public struct HomeView: View {
    
    @EnvironmentObject private var router: Router
    
    public var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                weekNiceCommunity
                todayGithub
                todayBaekjoon
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 108)
        }
        .background(Color.backgroundColor)
    }
    
    @ViewBuilder
    private var weekNiceCommunity: some View {
        VStack(spacing: 12) {
            SubTitle("이번주 인기글")
                .padding(.top, 20)
            
            VStack(spacing: 12) {
                ForEach(0..<3, id: \.self) { _ in
                    InfinityCommunityCell {
                        router.navigate(to: HomeDestination.communityDetail)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var todayGithub: some View {
        VStack(spacing: 12) {
            SubTitle("오늘의 Github Top 3")
            VStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { i in
                    InfinityGithubRankCell(rank: i + 1) {
                        router.navigate(to: HomeDestination.profileDetail)
                    }
                    .cardView()
                }
            }
        }
    }
    
    @ViewBuilder
    private var todayBaekjoon: some View {
        VStack(spacing: 12) {
            SubTitle("오늘의 백준 Top 3")
            VStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { i in
                    InfinityGithubRankCell(rank: i + 1) {
                        router.navigate(to: HomeDestination.profileDetail)
                    }
                    .cardView()
                }
            }
        }
    }
}
