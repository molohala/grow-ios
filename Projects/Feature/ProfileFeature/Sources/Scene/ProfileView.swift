import SwiftUI
import DesignSystem
import BaseFeature
import ProfileFeatureInterface

public struct ProfileView: View {
    
    @EnvironmentObject private var router: Router
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                profile
                stats
                InfinityGithubCell {
                }
                InfinityBaekjoonCell {
                }
                logout
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            .padding(.bottom, 108)
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
                    router.navigate(to: ProfileDestination.setting)
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
    private var stats: some View {
        HStack(spacing: 16) {
            InfinityStatCell("커밋 개수", type: .github(1204)) {
                // nav
            }
            InfinityStatCell("문제 푼 개수", type: .baekjoon(385)) {
                // nav
            }
        }
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
