import SwiftUI
import MyDesignSystem

public struct GrowStatCellShimmer: View {
    
    public init() {}
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                RowShimmer(width: 40)
                Spacer()
            }
            RowShimmer(width: 100)
        }
        .padding(16)
        .applyCardView()
    }
}
