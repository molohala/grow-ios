import SwiftUI
import DesignSystem
import BaseFeature
import ProfileFeatureInterface

public struct ProfileView: View {
    
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var appState: AppState
    @StateObject private var viewModel: ProfileViewModel
    
    public init(
        viewModel: ProfileViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView() {
            LazyVStack(spacing: 12) {
                info
                stats
            }
            .padding(.horizontal, 12)
        }
        .scrollIndicators(.hidden)
        .growTopBar("프로필", background: .backgroundAlt)
        .refreshable {
            Task {
                await appState.fetchProfile()
            }
        }
    }
    
    @ViewBuilder
    private var info: some View {
        HStack(spacing: 0) {
            HStack(spacing: 8) {
                switch appState.profile {
                case .fetching:
                    GrowAvatarShimmer(type: .large)
                    RowShimmer(width: 40)
                case .success(let data):
                    GrowAvatar(type: .large)
                    RowShimmer(width: 40)
                case .failure:
                    Text("불러오기 실패")
                }
            }
            Spacer()
            Image(icon: .setting)
                .resizable()
                .growIconColor(.textAlt)
                .frame(size: 32)
        }
        .padding(12)
        .applyCardView()
    }
    
    @ViewBuilder
    private var stats: some View {
        HStack(spacing: 12) {
            switch appState.github {
            case .fetching:
                GrowStatCellShimmer()
            case .success(let data):
                GrowStatCell(
                    label: "커밋 개수",
                    type: .github(commit: data?.totalCommits)) {
                        // action
                    }
            case .failure:
                Text("불러오기 실패")
            }
            switch appState.baekjoon {
            case .fetching:
                GrowStatCellShimmer()
            case .success(let data):
                GrowStatCell(
                    label: "커밋 개수",
                    type: .baekjoon(solved: data?.totalSolves)) {
                        // action
                    }
            case .failure:
                Text("불러오기 실패")
            }
        }
    }
    
    @ViewBuilder
    private var chart: some View {
//        switch appState.profile {
//        case .fetching:
//            <#code#>
//        case .success(let data):
//            <#code#>
//        case .failure:
//            <#code#>
//        }
        EmptyView() // todo add
    }
}
