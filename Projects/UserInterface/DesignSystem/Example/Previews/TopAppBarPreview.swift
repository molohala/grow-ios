import SwiftUI
import DesignSystem
import MyDesignSystem

struct TopAppBarPreview: View {
    
    @State private var includeBackButton = false
    @State private var selectedTab = BottomTabType.Home
    
    var body: some View {
        MyBottomTabBar(selectedTab: selectedTab, onTap: { tab in
            selectedTab = tab
        }) {
            ScrollView {
                VStack {
                    Text("정말 반갑습니다")
                        .myColor(.textNormal)
                    Toggle("", isOn: $includeBackButton)
                }
            }
            .myTopBar("제목을 입력해주세요", backButtonAction: includeBackButton ? {} : nil)
        }
    }
}
