import SwiftUI
import DesignSystem
import BaseFeature
import BaekjoonRankFeatureInterface

public struct BaekjoonRankView: View {
    
    @EnvironmentObject private var appState: AppState
    @ObservedObject private var viewModel: BaekjoonRankViewModel
    
    @EnvironmentObject private var router: Router
    
    public init(
        viewModel: BaekjoonRankViewModel
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    if case .success(let profile) = appState.profile,
                       profile.socialAccounts.first(where: { $0.socialType == .GITHUB }) == nil {
                        githubSetting
                            .padding(.horizontal, 24)
                    }
                    selector
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                    switch (viewModel.baekjoonRanks, appState.profile) {
                    case (.fetching, _), (_, .fetching):
                        ForEach(0..<7, id: \.self) { _ in
                            GrowRankCellShimmer()
                                .padding(.horizontal, 16)
                                .shimmer()
                        }
                    case (.success(let data), .success(let profile)):
                        ForEach(data, id: \.memberId) { rank in
                            GrowRankCell(rank: rank, isMe: profile.id == rank.memberId) {
                                router.navigate(to: BaekjoonDestination.profileDetail(memberId: rank.memberId))
                            }
                            .padding(.horizontal, 16)
                        }
                    default:
                        Text("불러오기 실패..")
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 128)
            }
            .refreshable {
                Task {
                    await viewModel.handleGithubRank()
                }
            }
        }
        .task {
            await viewModel.handleGithubRank()
        }
    }
    
    @ViewBuilder
    private var githubSetting: some View {
        VStack {
            Text("아직 백준 설정이 완료되지 않았네요")
                .foregroundStyle(.gray)
                .font(.caption)
            Text("백준 설정을 하고 순위권에 도전해 보세요!")
                .font(.callout)
                .multilineTextAlignment(.center)
                .lineLimit(1)
            GrowButton("설정하기", height: 40) {
                router.navigate(to: BaekjoonDestination.baekjoonSetting)
            }
            .frame(width: 150)
            .font(.callout)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 8)
        .padding(.vertical, 24)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .foregroundStyle(.gray.opacity(0.3))
        }
    }
    
    @ViewBuilder
    private var selector: some View {
        HStack(spacing: 8) {
            ForEach(BaekjoonRankViewModel.BaekjoonTab.allCases, id: \.self) { tab in
                GrowSelector(text: tab.rawValue, isSelected: tab == viewModel.selectedTab) {
                    viewModel.selectedTab = tab
                }
            }
            Spacer()
        }
    }
}
