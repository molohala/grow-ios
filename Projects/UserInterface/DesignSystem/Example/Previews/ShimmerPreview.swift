import SwiftUI
import DesignSystem

struct ShimmerPreview: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 100, height: 20)
                .background(GrowPallete.shared.Transparent)
                .shimmer()
                .cornerRadius(4, corners: .allCorners)
        }
    }
}
