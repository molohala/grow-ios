import SwiftUI
import CommunityServiceInterface
import DesignSystem
import Pow

public struct CommunityCell: View {
    
    private let community: Community
    private let likeAction: () async -> Void
    private let editAction: () async -> Void
    private let removeAction: () async -> Void
    private let action: () -> Void
    
    public init(
        community: Community,
        likeAction: @escaping () async -> Void,
        editAction: @escaping () async -> Void,
        removeAction: @escaping () async -> Void,
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
//               profile.id == community.community.writerId {
//                HStack {
//                    Spacer()
//                    VStack {
//                        Menu {
//                            Button("수정하기") {
//                                Task {
//                                    await editAction()
//                                }
//                            }
//                            Button("삭제하기", role: .destructive) {
//                                Task {
//                                    await removeAction()
//                                }
//                            }
//                        } label: {
//                            DesignSystemAsset.detailVerticalLine.swiftUIImage
//                                .resizable()
//                                .renderingMode(.template)
//                                .frame(width: 24, height: 24)
//                                .foregroundStyle(Color.gray)
//                        }
//                        .padding(12)
//                        Spacer()
//                    }
//                }
        }
    }
    
    @ViewBuilder
    private var label: some View {
        VStack(alignment: .leading, spacing: 16) {
            profile
            VStack(spacing: 4) {
                HStack {
                    Text(LocalizedStringKey(community.community.content))
                        .font(.callout)
                        .applyOpenURL()
                        .lineLimit(6)
                    Spacer()
                }
                if community.community.content.count > 30 {
                    HStack {
                        Text("...")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                }
            }
            VStack(spacing: 8) {
                info
                recentComment
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
                Task {
                    await likeAction()
                }
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
    private var recentComment: some View {
        if let recentComment = community.recentComment {
            Divider()
            HStack(spacing: 4) {
                Text(recentComment.name)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(LocalizedStringKey(recentComment.content))
                    .font(.footnote)
                    .applyOpenURL()
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text(recentComment.createdAt.timeAgo)
                    .font(.caption)
                    .foregroundStyle(.gray)
                Spacer()
            }
        }
    }
}
