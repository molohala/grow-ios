import SwiftUI
import DesignSystem

struct TopAppBarPreview: View {
    
    @State private var includeBackButton = false
    @State private var selectedTab = BottomTabType.Home
    
    var body: some View {
        GrowBottomTabBar(selectedTab: $selectedTab) {
            ScrollView {
                VStack {
                    Text("정말 반갑습니다")
                        .growColor(.textNormal)
                    Toggle("", isOn: $includeBackButton)
                }
            }
            .growTopBar("제목을 입력해주세요", backButtonAction: includeBackButton ? {} : nil)
        }
    }
}
