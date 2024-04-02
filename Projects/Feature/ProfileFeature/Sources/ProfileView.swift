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
                github
                baekjoon
                logout
            }
            .padding(.top, 16)
            .padding(.horizontal, 12)
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
    private var github: some View {
        Button {
        } label: {
            VStack {
                HStack {
                    DesignSystemAsset.github.swiftUIImage
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color(0x24292e))
                    Text("nohjason")
                        .font(.body)
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.gray)
                        .font(.body)
                }
                Text("대충 여기 그래프")
                    .padding(.vertical, 40)
            }
            .applyCardView()
        }
        .applyAnimation()
    }
    
    @ViewBuilder
    private var baekjoon: some View {
        Button {
        } label: {
            VStack {
                HStack {
                    DesignSystemAsset.baekjoon.swiftUIImage
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 28)
                        .foregroundStyle(Color(0x0076C0))
                    Text("nohjason")
                        .font(.body)
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.gray)
                        .font(.body)
                }
                Text("대충 여기 그래프")
                    .padding(.vertical, 40)
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
