import SwiftUI
import DesignSystem
import MyDesignSystem

struct AvatarPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(AvatarType.allCases, id: \.self) {
                    MyAvatar(type: $0)
                }
                ForEach(AvatarType.allCases, id: \.self) {
                    MyAvatar("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXmP3sgy4ULmNQgAajfnDXomXm3EQBocUfH_D7avoJRw&s", type: $0)
                }
            }
        }
        .myBackground(.background)
    }
}
