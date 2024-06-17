import SwiftUI
import DesignSystem

struct StatCellPreview: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                GrowStatCell(label: "오늘 푼 문제", type: .baekjoon(solved: 100)) {}
                GrowStatCell(label: "오늘 푼 문제", type: .baekjoon(solved: nil)) {}
            }
            HStack(spacing: 12) {
                GrowStatCell(label: "오늘 푼 문제", type: .github(commit: 100)) {}
                GrowStatCell(label: "오늘 푼 문제", type: .github(commit: nil)) {}
            }
            HStack(spacing: 12) {
                GrowStatCellShimmer()
                GrowStatCellShimmer()
            }
        }
        .myBackground(.backgroundAlt)
    }
}
