import SwiftUI
import DesignSystem

struct AvatarPreview: View {
    var body: some View {
        VStack {
            ForEach(AvatarType.allCases, id: \.self) {
                GrowAvatar(type: $0)
            }
            ForEach(AvatarType.allCases, id: \.self) {
                GrowAvatar("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXmP3sgy4ULmNQgAajfnDXomXm3EQBocUfH_D7avoJRw&s", type: $0)
            }
        }
    }
}
