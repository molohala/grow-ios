import SwiftUI
import DesignSystem

struct ButtonPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(ButtonType.allCases, id: \.self) {
                    GrowButton("완료", type: $0, leadingIcon: .check) {}
                    GrowButton("시작하기", type: $0) {
                        try? await Task.sleep(for: .seconds(1))
                    }
                    GrowButton("시작하기", type: $0, isEnabled: false) {}
                    
                    GrowTextButton("완료", type: $0, leadingIcon: .check) {}
                    GrowTextButton("시작하기", type: $0) {
                        try? await Task.sleep(for: .seconds(1))
                    }
                    GrowTextButton("시작하기", type: $0, isEnabled: false) {}
                }
                GrowTabButton("완료", leadingIcon: .check) {}
                GrowTabButton("시작하기") {
                    try? await Task.sleep(for: .seconds(1))
                }
                GrowTabButton("시작하기", isSelected: false) {}
                
                GrowToggle(isOn: .constant(true))
                GrowToggle(isOn: .constant(false))
            }
        }
        .growTopBar("") {}
    }
}
