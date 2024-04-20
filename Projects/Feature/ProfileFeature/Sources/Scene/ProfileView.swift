import SwiftUI
import DesignSystem
import BaseFeature
import ProfileFeatureInterface

public struct ProfileView: View {
    
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel: ProfileViewModel
    
    public init(
        viewModel: ProfileViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                profile
                stats
                InfinityChartCell(title: "27", subtitle: "이번주에 푼 문제", subject: viewModel.selectedChart.rawValue, chartData: .init(data: InfinityChartData.dummy, color: .orange500), selectedType: $viewModel.selectedChart)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            .padding(.bottom, 108)
        }
        .background(Color.backgroundColor)
    }
    
    @ViewBuilder
    private var profile: some View {
        VStack {
            HStack(spacing: 0) {
                Rectangle()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                Text("노영재")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(.leading, 8)
                
                Spacer()
                Button {
                    router.navigate(to: ProfileDestination.setting)
                } label: {
                    Text("설정")
                        .font(.callout)
                        .foregroundStyle(.gray)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(Color.backgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .applyAnimation()
            }
            Text("\"뚝딱뚝딱.\"")
                .padding(.vertical, 16)
                .font(.callout)
                .foregroundStyle(.gray)
        }
        .applyCardView()
    }
    
    @ViewBuilder
    private var stats: some View {
        HStack(spacing: 16) {
            InfinityStatCell("커밋 개수", type: .github(1204)) {
                // nav
            }
            InfinityStatCell("문제 푼 개수", type: .baekjoon(385)) {
                // nav
            }
        }
    }
}
