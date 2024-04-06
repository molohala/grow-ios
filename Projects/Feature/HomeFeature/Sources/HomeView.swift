import SwiftUI
import DesignSystem

public struct HomeView: View {
    
    public init() {}
    
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
    }
    
    @ViewBuilder
    private var weekNiceCommunity: some View {
        VStack(spacing: 12) {
            SubTitle("이번주 인기글")
                .padding(.top, 20)
            
            VStack(spacing: 12) {
                ForEach(0..<3, id: \.self) { _ in
                    Button {
                        //
                    } label: {
                        InfinityCommunityCell {
                            //
                        }
                    }
                    .applyAnimation()
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
                        //
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
                        //
                    }
                    .cardView()
                }
            }
        }
    }
}
