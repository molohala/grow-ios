import SwiftUI
import DesignSystem

struct ButtonPreview: View {
    var body: some View {
        VStack {
            GrowCTAButton("완료", leadingIcon: .check) {
                
            }
            GrowCTAButton("시작하기") {}
            GrowCTAButton("시작하기") {
                try? await Task.sleep(for: .seconds(1))
            }
            GrowCTAButton("시작하기", isEnabled: false) {
                try? await Task.sleep(for: .seconds(1))
            }
        }
        .growTopBar("") {}
    }
}
