import SwiftUI
import DesignSystem

struct RankCellPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                GrowRankCell(name: "이강현", socialId: "bestswlkh0310", rank: 1, label: "1 문제") {}
                GrowRankCell(name: "이강현", socialId: "bestswlkh0310", rank: 2, label: "1 문제") {}
                GrowRankCell(name: "이강현", socialId: "bestswlkh0310", rank: 3, label: "1 문제") {}
                GrowRankCell(name: "이강현", socialId: "bestswlkh0310", rank: 4, label: "1 문제") {}
                GrowRankCellShimmer()
            }
        }
        .myBackground(.background)
    }
}
