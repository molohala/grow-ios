import SwiftUI
import DesignSystem

struct DividerPreview: View {
    var body: some View {
        VStack {
            GrowDivider()
            GrowDivider(type: .thick)
            Spacer()
        }
        .growBackground(.background)
    }
}
