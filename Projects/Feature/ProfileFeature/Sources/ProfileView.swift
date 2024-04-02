import SwiftUI
import DesignSystem

public struct ProfileView: View {
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack {
                profile
            }
            .padding(.horizontal, 12)
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack {
            Rectangle()
                .frame(width: 72, height: 72)
                .clipShape(Circle())
                .foregroundStyle(.gray)
            Text("노영재")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .padding(.leading, 8)
            Spacer()
        }
    }
    
    @ViewBuilder
    private var github: some View {
        EmptyView()
    }
    
    @ViewBuilder
    private var baekjoon: some View {
        EmptyView()
    }
}
