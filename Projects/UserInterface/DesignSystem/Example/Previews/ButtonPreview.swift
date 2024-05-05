import SwiftUI
import DesignSystem

struct ButtonPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(ButtonType.allCases, id: \.self) {
                    GrowButton("완료", type: $0, leadingIcon: .check) {
                        
                    }
                    GrowButton("시작하기", type: $0) {}
                    GrowButton("시작하기", type: $0) {
                        try? await Task.sleep(for: .seconds(1))
                    }
                    GrowButton("시작하기", type: $0, isEnabled: false) {
                        try? await Task.sleep(for: .seconds(1))
                    }
                }
            }
        }
        .growTopBar("") {}
    }
}
