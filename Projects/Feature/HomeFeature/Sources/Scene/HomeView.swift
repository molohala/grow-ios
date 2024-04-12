import SwiftUI
import HomeFeatureInterface
import DesignSystem
import BaseFeature
import CommunityFeatureInterface

public struct HomeView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    
    @ObservedObject private var viewModel: HomeViewModel
    
    public init(
        viewModel: HomeViewModel
    ) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollView {
            LazyVStack(spacing: 40) {
                profile
                    .padding(.top, 24)
                todayGithub
                todayBaekjoon
                weekNiceCommunity
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 108)
        }
        .background(Color.backgroundColor)
    }
    
    @ViewBuilder
    private var profile: some View {
        VStack(spacing: 16) {
            SubTitle("iOS 개발자\n이강현님 환영합니다")
                .lineSpacing(4.0)
                .font(.title)
            HStack(spacing: 16) {
                InfinityStatCell("오늘 한 커밋 개수", type: .github(7)) {
                    // nav
                }
                InfinityStatCell("오늘 푼 문제 개수", type: .baekjoon(3)) {
                    // nav
                }
            }
        }
    }
    
    @ViewBuilder
    private var weekNiceCommunity: some View {
        VStack(spacing: 12) {
            SubTitle("이번주 인기글")
            VStack(spacing: 12) {
                ForEach(viewModel.weekCommunities, id: \.communityId) { community in
                    CommunityCell(community: community) {
                        router.navigate(to: HomeDestination.communityDetail)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var todayGithub: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
//                DesignSystemAsset.github.swiftUIImage
//                    .resizable()
//                    .renderingMode(.template)
//                    .foregroundStyle(Color.github)
//                    .frame(width: 30, height: 30)
//                    .padding(.leading, 4)
                SubTitle("오늘의 Github Top 3")
                Spacer()
            }
            let dummyProfileId = 2
            VStack(spacing: 12) {
                ForEach(0..<3, id: \.self) { i in
                    InfinityGithubRankCell(rank: i + 1, isMe: i == dummyProfileId) {
                        router.navigate(to: HomeDestination.profileDetail)
                    }
                }
            }
            .padding(.vertical, 4)
            .applyCardView()
        }
    }
    
    @ViewBuilder
    private var todayBaekjoon: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
//                DesignSystemAsset.baekjoon.swiftUIImage
//                    .resizable()
//                    .renderingMode(.template)
//                    .foregroundStyle(Color.baekjoon)
//                    .frame(width: 30, height: 30)
//                    .padding(.leading, 4)
                SubTitle("오늘의 백준 Top 3")
                Spacer()
            }
            let dummyProfileId = 1
            VStack(spacing: 12) {
                ForEach(0..<3, id: \.self) { i in
                    InfinityGithubRankCell(rank: i + 1, isMe: dummyProfileId == i) {
                        router.navigate(to: HomeDestination.profileDetail)
                    }
                }
            }
            .padding(.vertical, 4)
            .applyCardView()
        }
    }
}
