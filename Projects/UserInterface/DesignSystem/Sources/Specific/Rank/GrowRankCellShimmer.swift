import SwiftUI

public struct GrowRankCellShimmer: View {
    public init() {}
    
    public var body: some View {
        HStack {
            HStack(spacing: 8) {
                GrowAvatarShimmer(type: .large)
                RowShimmer(width: 100)
            }
            Spacer()
            RowShimmer(width: 40)
        }
        .padding(4)
    }
}
