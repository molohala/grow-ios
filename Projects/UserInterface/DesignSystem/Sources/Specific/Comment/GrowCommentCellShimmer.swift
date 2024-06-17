import SwiftUI
import MyDesignSystem

public struct GrowCommentCellShimmer: View {
    
    public init() {}
    
    public var body: some View {
        HStack(alignment: .top) {
            HStack(alignment: .top, spacing: 8) {
                MyAvatarShimmer(type: .large)
                VStack(alignment: .leading, spacing: 4) {
                    RowShimmer(width: 30)
                    RowShimmer(width: 100)
                }
            }
            Spacer()
        }
        .padding(12)
    }
}
