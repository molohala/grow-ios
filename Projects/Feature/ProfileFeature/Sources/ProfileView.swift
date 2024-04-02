import SwiftUI
import DesignSystem

public struct ProfileView: View {
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack {
                profile
            }
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack {
            Rectangle()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .foregroundStyle(.gray)
            Text("노영재")
                .font(.callout)
                .foregroundStyle(.black)
            Spacer()
        }
    }
}
