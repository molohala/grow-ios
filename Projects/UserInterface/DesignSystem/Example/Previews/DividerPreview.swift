import SwiftUI
import DesignSystem
import MyDesignSystem

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
