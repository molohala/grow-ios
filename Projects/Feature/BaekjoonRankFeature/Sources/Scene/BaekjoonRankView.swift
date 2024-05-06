import SwiftUI
import DesignSystem
import BaseFeature
import BaekjoonRankFeatureInterface

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
            }
            indicator
            switch viewModel.baekjoonRanks {
            case .fetching:
                VStack(spacing: 0) {
                    GrowRankCellShimmer()
                }
                .padding(.horizontal, 20)
            case .success(let data):
                LazyVStack(spacing: 12) {
                    ForEach(data, id: \.memberId) { rank in
                        GrowRankCell(
                            name: rank.memberName,
                            socialId: rank.socialId,
                            rank: rank.rank,
                            label: "\(rank.count) 문제",
                            action: {})
                    }
                }
                .padding(12)
            case .failure:
                Text("불러오기 실패")
            }
        }
        .growTopBar("백준 랭킹")
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
                .growFont(.bodyM)
                .growColor(.textNormal)
            GrowButton("설정하기", type: .Small) {
                router.navigate(to: BaekjoonDestination.baekjoonSetting)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 16)
        .toCenter()
        .stroke(12, content: colorProvider.color(.textAlt))
        .padding(16)
    }
    
    @ViewBuilder
    private var indicator: some View {
        HStack(spacing: 12) {
            ForEach(BaekjoonTab.allCases, id: \.self) { tab in
                GrowTabButton(
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

/**
 Row(
       modifier = Modifier
           .padding(start = 12.dp),
       horizontalArrangement = Arrangement.spacedBy(12.dp)
   ) {
       BaekjoonRankTab.entries.forEach {
           GrowTabButton(
               modifier = Modifier,
               text = it.label,
               selected = it == selectedTab,
               type = ButtonType.Small,
               shape = CircleShape
           ) {
               onClickTab(it)
           }
       }
       Spacer(modifier = Modifier.weight(1f))
   }
 */
