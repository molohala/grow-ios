import SwiftUI
import RankServiceInterface

public struct InfinityBaekjoonRankCellShimmer: View {
    
    public init() {}
    
    public var body: some View {
        label
    }
    
    @ViewBuilder
    private var label: some View {
        HStack(spacing: 12) {
            Rectangle()
                .foregroundStyle(.gray)
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                HStack {
                    Text("---")
                        .font(.body)
                }
                Text("--------")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .background(.background)
        .frame(minHeight: 50)
    }
}
