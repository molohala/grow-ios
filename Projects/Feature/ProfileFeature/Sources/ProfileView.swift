import SwiftUI
import DesignSystem

public struct ProfileView: View {
    
    var navigateToProfileEdit: () -> Void
    
    public init(
        navigateToProfileEdit: @escaping () -> Void
    ) {
        self.navigateToProfileEdit = navigateToProfileEdit
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                profile
                InfinityGithubCell {
                }
                InfinityBaekjoonCell {
                }
                logout
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        Button {
            navigateToProfileEdit()
        } label: {
            HStack {
                Rectangle()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                Text("노영재")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(.leading, 8)
                
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundStyle(.gray)
                    .font(.body)
            }
            .applyCardView()
        }
        .applyAnimation()
    }
    
    @ViewBuilder
    private var logout: some View {
        Button {
        } label: {
            HStack {
                Text("로그아웃")
                    .font(.body)
                    .foregroundStyle(.red)
                    .fontWeight(.medium)
                    .padding(4)
                Spacer()
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.body)
                    .foregroundStyle(.red)
            }
            .applyCardView()
        }
        .applyAnimation()
    }
}
