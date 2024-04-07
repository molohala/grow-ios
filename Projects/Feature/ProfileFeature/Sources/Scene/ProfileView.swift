import SwiftUI
import DesignSystem

public struct ProfileView: View {
    
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
            .padding(.bottom, 64)
        }
        .background(Color.backgroundColor)
    }
    
    @ViewBuilder
    private var profile: some View {
        VStack {
            HStack(spacing: 0) {
                Rectangle()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                Text("노영재")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(.leading, 8)
                
                Spacer()
                Button {
//                    navigateToSetting()
                } label: {
                    Text("설정")
                        .font(.callout)
                        .foregroundStyle(.gray)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(Color.backgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .applyAnimation()
            }
            Text("\"뚝딱뚝딱.\"")
                .padding(.vertical, 16)
                .font(.callout)
                .foregroundStyle(.gray)
        }
        .applyCardView()
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
                Icon.logoutIcon
            }
            .applyCardView()
        }
        .applyAnimation()
    }
}
