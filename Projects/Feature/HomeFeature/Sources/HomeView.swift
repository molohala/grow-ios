import SwiftUI
import DesignSystem

public struct HomeView: View {
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack {
                weekNiceCommunity
                todayGithub
                todayBaekjoon
            }
            .padding(.horizontal, 16)
        }
    }
    
    @ViewBuilder
    private var weekNiceCommunity: some View {
        SubTitle("이번주 인기글")
            .padding(.top, 16)
        
        ForEach(0..<3, id: \.self) { i in
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
    
    @ViewBuilder
    private var todayGithub: some View {
        SubTitle("오늘의 Github Top 3")
            .padding(.top, 24)
        
        ForEach(0..<3, id: \.self) { i in
            InfinityGithubRankCell(rank: i + 1) {
                //
            }
            .cardView()
        }
    }
    
    @ViewBuilder
    private var todayBaekjoon: some View {
        SubTitle("오늘의 백준 Top 3")
            .padding(.top, 24)
        
        ForEach(0..<3, id: \.self) { i in
            InfinityGithubRankCell(rank: i + 1) {
                //
            }
            .cardView()
        }
    }
}
