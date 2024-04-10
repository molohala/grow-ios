import BaseFeature
import SwiftUI
import DesignSystem

public struct CommunityDetailView: View {
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                profile
                Text("지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존지존")
                    .font(.body)
                    .lineSpacing(.infinityLineSpacing)
                    .fontWeight(.medium)
                info
            }
            .padding(.horizontal, 16)
        }
        .background(Color.white)
        .infinityTopBar("")
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(spacing: 2) {
                Text("노영재")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                Text("1시간 전")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                    .padding(.leading, 4)
            }
            Spacer()
            Button {
                //
            } label: {
                DesignSystemAsset.detailVerticalLine.swiftUIImage
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .foregroundStyle(Color.gray)
            }
        }
    }
    
    @ViewBuilder
    private var info: some View {
        HStack {
            Button {
                //
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "heart.fill")
                        .font(.headline)
                        .foregroundStyle(Color.red400)
                    
                    Text("10")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            Spacer()
        }
    }
}
