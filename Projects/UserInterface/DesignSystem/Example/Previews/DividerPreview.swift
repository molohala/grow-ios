import SwiftUI
import DesignSystem

struct DividerPreview: View {
    var body: some View {
        VStack {
            MyDivider()
            MyDivider(type: .thick)
            Spacer()
        }
        .myBackground(.background)
    }
}
