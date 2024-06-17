import SwiftUI
import DesignSystem

struct ShimmerPreview: View {
    
    @EnvironmentObject var c: ColorProvider
    
    var body: some View {
        VStack {
            RowShimmer(width: 100)
            MyAvatarShimmer(type: .large)
            Spacer()
        }
        .toCenter()
        .myBackground(.background)
    }
}
