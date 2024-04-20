import SwiftUI
import CommunityServiceInterface
import DesignSystem
import Pow

public struct CommunityCell: View {
    
    private let community: Community
    private let likeAction: () -> Void
    private let editAction: () -> Void
    private let removeAction: () -> Void
    private let action: () -> Void
    
    public init(
        community: Community,
        likeAction: @escaping () -> Void,
        editAction: @escaping () -> Void,
        removeAction: @escaping () -> Void,
        action: @escaping () -> Void
    ) {
        self.community = community
        self.likeAction = likeAction
        self.editAction = editAction
        self.removeAction = removeAction
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            Button {
                action()
            } label: {
                label
            }
            .applyAnimation()
            HStack {
                Spacer()
                VStack {
                    Menu {
                        Button("수정하기", action: editAction)
                        Button("삭제하기", role: .destructive, action: removeAction)
                    } label: {
                        DesignSystemAsset.detailVerticalLine.swiftUIImage
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.gray)
                    }
                    .padding(12)
                    Spacer()
                }
            }
        }
    }
    
    @ViewBuilder
    private var label: some View {
        VStack(alignment: .leading, spacing: 16) {
            profile
            VStack(spacing: 4) {
                TextWrapper(community.community.content, font: .callout, allowTruncating: true)
                HStack {
                    Text("더보기")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    Spacer()
                }
            }
            VStack(spacing: 8) {
                info
                Divider()
                lastComment
            }
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
                Text(community.community.writerName)
                    .font(.callout)
                    .fontWeight(.semibold)
                Text(community.community.createdAt.timeAgo)
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 8)
            Spacer()
        }
    }
    
    @ViewBuilder
    private var info: some View {
        HStack(spacing: 4) {
            Button {
                likeAction()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: community.community.liked ? "heart.fill" : "heart")
                        .font(Font.title3)
                        .foregroundStyle(community.community.liked ? Color.red400 : Color.gray500)
                    Text("\(community.community.like)")
                        .font(.callout)
                        .foregroundStyle(community.community.liked ? Color.red400 : Color.gray500)
                }
                .padding(6)
                .background(community.community.liked ? Color.red100 : .white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    EmptyView()
                        .changeEffect(
                            .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
                                if community.community.liked {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                }
                            },
                            value: community.community.liked
                        )
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var lastComment: some View {
        if let recentComment = community.recentComment {
            HStack(spacing: 4) {
                Text(recentComment.name)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(recentComment.content)
                    .font(.footnote)
                Text(recentComment.createdAt.timeAgo)
                    .font(.caption)
                    .foregroundStyle(.gray)
                Spacer()
            }
        }
    }
}
