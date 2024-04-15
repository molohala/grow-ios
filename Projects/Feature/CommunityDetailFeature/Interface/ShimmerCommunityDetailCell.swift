import SwiftUI

public struct ShimmerCommunityDetailCell: View {
    
    public init() {}
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            let text = "지존이dd"
            profile
            Text(text)
                .font(.body)
                .fontWeight(.medium)
            Divider()
            comments
                .padding(.bottom, 64)
        }
        .padding(.horizontal, 16)
        .background(Color.white)
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
        }
    }
    
    @ViewBuilder
    private var comments: some View {
        LazyVStack(spacing: 20) {
            ForEach(0..<3, id: \.self) { _ in
                ShimmerCommentCell()
            }
        }
    }
}
