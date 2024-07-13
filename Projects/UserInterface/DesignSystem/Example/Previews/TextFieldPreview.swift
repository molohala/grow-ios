import SwiftUI
import DesignSystem
import MyDesignSystem

struct TextFieldPreview: View {
    
    @State private var id = ""
    @State private var pw = ""
    @State private var content = ""
    
    var body: some View {
        ScrollView {
            VStack {
                MyTextField("아이디", text: $id)
                MyTextField("비밀번호", text: $pw, isSecured: true)
                MyTextField("비밀번호", text: $pw, isEnabled: false, isRounded: true)
                MyTextEditor(text: $content)
                    .frame(height: 300)
                MyTextEditor(text: $content, isEnabled: false)
                    .frame(height: 300)
            }
        }
        .myBackground(.background)
    }
}
