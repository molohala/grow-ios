import SwiftUI
import DesignSystem
import MyDesignSystem

struct ButtonPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(ButtonType.allCases, id: \.self) {
                    MyButton("완료", type: $0, leadingIcon: .check) {}
                    MyButton("시작하기", type: $0) {
                        try? await Task.sleep(for: .seconds(1))
                    }
                    MyButton("시작하기", type: $0, isEnabled: false) {}
                    
                    MyTextButton("완료", type: $0, leadingIcon: .check) {}
                    MyTextButton("시작하기", type: $0) {
                        try? await Task.sleep(for: .seconds(1))
                    }
                    MyTextButton("시작하기", type: $0, isEnabled: false) {}
                }
                MyTabButton("완료", leadingIcon: .check, isSelected: true) {}
                MyTabButton("시작하기", isSelected: true) {
                    try? await Task.sleep(for: .seconds(1))
                }
                MyTabButton("시작하기", isSelected: false) {}
                
                MyToggle(isOn: .constant(true))
                MyToggle(isOn: .constant(false))
                MyLikeButton(like: 312, isLiked: true) {}
                MyLikeButton(like: 311, isLiked: false) {}
                
                MyRadioButton("Server", isSelected: true) {}
                MyRadioButton("Web", isSelected: false) {}
                MyRadioButton("Python", isSelected: true) {}
                MyRadioButton("HTML", isSelected: false) {}
            }
        }
        .myTopBar("") {}
    }
}
