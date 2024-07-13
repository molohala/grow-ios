import SwiftUI
import DesignSystem
import MyDesignSystem

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
