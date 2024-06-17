import SwiftUI
import DesignSystem
import BaseFeature
import BaekjoonRankFeatureInterface
import MyDesignSystem

public struct BaekjoonRankView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var colorProvider: ColorProvider
    @StateObject private var viewModel: BaekjoonRankViewModel
    
    public init(
        viewModel: BaekjoonRankViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if case .success(let data) = appState.baekjoon,
               data == nil {
                recommendingSettingBaekjoon
            } else {
                indicator
                switch viewModel.baekjoonRanks {
                case .fetching:
                    VStack(spacing: 12) {
                        ForEach(0..<3, id: \.self) { _ in
                            GrowRankCellShimmer()
                        }
                    }
                    .padding(12)
                case .success(let data):
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(data, id: \.memberId) { rank in
                                GrowRankCell(
                                    name: rank.memberName,
                                    socialId: rank.socialId,
                                    rank: rank.rank,
                                    label: "\(rank.count) 문제",
                                    action: {
                                        router.navigate(to: BaekjoonRankDestination.profileDetail(memberId: rank.memberId))
                                    }
                                )
                            }
                            Spacer().frame(height: 92)
                        }
                        .padding(12)
                    }
                case .failure:
                    EmptyView()
                }
            }
        }
        .myTopBar("백준 랭킹")
        .task {
            Task {
                await viewModel.fetchBaekjoonRank()
            }
        }
        .task(id: viewModel.selectedTab) {
            await viewModel.fetchBaekjoonRank()
        }
    }
    
    @ViewBuilder
    private var recommendingSettingBaekjoon: some View {
        VStack(spacing: 16) {
            Text("아직 백준 ID를 설정하지 않았어요")
                .myFont(.bodyM)
                .myColor(.textNormal)
            MyButton("설정하기", type: .Small) {
                router.navigate(to: BaekjoonRankDestination.baekjoonSetting)
            }
        }
        .toCenter()
    }
    
    @ViewBuilder
    private var indicator: some View {
        HStack(spacing: 12) {
            ForEach(BaekjoonTab.allCases, id: \.self) { tab in
                MyTabButton(
                    tab.rawValue,
                    isSelected: tab == viewModel.selectedTab
                ) {
                    viewModel.selectedTab = tab
                }
            }
            Spacer()
        }
        .padding(.leading, 12)
    }
}
