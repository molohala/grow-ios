import SwiftUI
import BaseFeature
import DesignSystem

public struct ProfileDetailView: View {
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                InfinityGithubCell {}
                InfinityBaekjoonCell {}
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .backgroundColor(.backgroundColor)
        .navigationTitle("노영재님의 프로필")
    }
    
    @ViewBuilder
    private var profile: some View {
        VStack {
            Text("\"뚝딱뚝딱.\"")
                .padding(.vertical, 16)
                .font(.callout)
                .foregroundStyle(.gray)
        }
        .applyCardView()
    }
}
