import BaseFeature
import SwiftUI
import DesignSystem

public struct CommunityDetailView: View {
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack {
                content
            }
        }
        .background(Color.white)
        .infinityTopBar("노영재님의 글")
    }
    
    @ViewBuilder
    private var content: some View {
        VStack(spacing: 16) {
            Text("지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존")
                .font(.body)
                .lineSpacing(.infinityLineSpacing)
                .fontWeight(.medium)
            Divider()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
    }
}
