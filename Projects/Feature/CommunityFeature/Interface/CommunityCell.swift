import SwiftUI
import CommunityServiceInterface
import DesignSystem

public struct CommunityCell: View {
    
    private let community: Community
    private let likeAction: () -> Void
    private let commentAction: () -> Void
    private let detailAction: () -> Void
    private let action: () -> Void
    
    public init(
        community: Community,
        likeAction: @escaping () -> Void,
        commentAction: @escaping () -> Void,
        detailAction: @escaping () -> Void,
        action: @escaping () -> Void
    ) {
        self.community = community
        self.likeAction = likeAction
        self.commentAction = commentAction
        self.detailAction = detailAction
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            label
        }
        .applyAnimation()
    }
    
    @ViewBuilder
    private var label: some View {
        VStack(alignment: .leading, spacing: 16) {
            profile
            Text(community.content)
                .lineSpacing(.infinityLineSpacing)
                .font(.callout)
                .fontWeight(.medium)
            info
        }
        .applyCardView()
    }
    
    @ViewBuilder
    private var profile: some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(alignment: .leading, spacing: 2) {
                Text(community.writer)
                    .font(.callout)
                    .fontWeight(.semibold)
                Text(community.createdAt.timeAgo)
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 8)
            Spacer()
            Button {
                detailAction()
            } label: {
                DesignSystemAsset.detailVerticalLine.swiftUIImage
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.gray)
            }
        }
    }
    
    @ViewBuilder
    private var info: some View {
        HStack(spacing: 0) {
            Button {
                likeAction()
            } label: {
                Image(systemName: "heart.fill")
                    .font(.body)
                    .foregroundStyle(Color.red400)
            }
            Text("\(community.like)")
                .font(.footnote)
                .foregroundStyle(.gray)
            Button {
                commentAction()
            } label: {
                Image(systemName: "message.fill")
                    .font(.body)
                    .foregroundStyle(Color.gray500)
            }
            .padding(.leading, 8)
            Text("32")
                .font(.footnote)
                .foregroundStyle(.gray)
            Spacer()
        }
    }
}
