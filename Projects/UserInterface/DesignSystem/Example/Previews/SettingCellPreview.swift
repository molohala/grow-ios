import SwiftUI
import DesignSystem

struct SettingCellPreview: View {
    var body: some View {
        VStack {
            GrowSettingCell(label: "정말 반갑습니다", description: "")
            GrowSettingCell(label: "정말 반갑습니다", description: "", action:  {})
        }
        .padding(12)
        .myBackground(.backgroundAlt)
    }
}
