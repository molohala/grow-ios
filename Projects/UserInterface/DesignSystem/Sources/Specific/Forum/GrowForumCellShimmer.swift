import SwiftUI

public struct GrowForumCellShimmer: View {
    
    public init() {}
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                GrowAvatarShimmer(type: .medium)
                RowShimmer(width: 50)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 4) {
                RowShimmer(width: 100)
                RowShimmer(width: 240)
            }
        }
        .padding(12)
        .applyCardView()
    }
}
