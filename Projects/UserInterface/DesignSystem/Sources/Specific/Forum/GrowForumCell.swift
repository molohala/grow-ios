import SwiftUI
import CommunityServiceInterface

public struct GrowForumCell: View {
    
    private let forum: Community
    private let profileId: Int
    private let likeAction: () -> Void
    private let removeAction: () -> Void
    private let editAction: () -> Void
    private let action: () -> Void
    
    public init(
        forum: Community,
        profileId: Int,
        likeAction: @escaping () -> Void,
        removeAction: @escaping () -> Void,
        editAction: @escaping () -> Void,
        action: @escaping () -> Void
    ) {
        self.forum = forum
        self.profileId = profileId
        self.likeAction = likeAction
        self.removeAction = removeAction
        self.editAction = editAction
        self.action = action
    }
    
    public var body: some View {
        
        let content = forum.community
        let recentComment = forum.recentComment
        
        ZStack(alignment: .top) {
            Button {
                action()
            } label: {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 8) {
                        GrowAvatar(type: .medium)
                        VStack(alignment: .leading) {
                            Text(content.writerName)
                                .growFont(.bodyB)
                                .growColor(.textNormal)
                            Text(content.createdAt.timeAgo)
                                .growFont(.labelM)
                                .growColor(.textAlt)
                        }
                        Spacer()
                    }
                    Text(content.content)
                        .lineLimit(5)
                        .growFont(.bodyR)
                        .truncationMode(.tail)
                        .growColor(.textNormal)
                        .lineSpacing(5)
                    GrowLikeButton(like: content.like, isLiked: content.liked) {
                        likeAction()
                    }
                    if let recentComment {
                        GrowDivider()
                        HStack(spacing: 4) {
                            Text(recentComment.name)
                                .growFont(.labelB)
                                .growColor(.textNormal)
                            Text(recentComment.content)
                                .applyOpenURL()
                                .growColor(.textNormal)
                                .growFont(.labelR)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            Text(recentComment.createdAt.timeAgo)
                                .growFont(.labelM)
                                .growColor(.textAlt)
                            Spacer()
                        }
                    }
                }
                .padding(12)
                .applyCardView()
            }
            .applyAnimation()
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 8) {
                    Spacer()
                    Menu {
                        Button("수정하기") {
                            editAction()
                        }
                        Button("삭제하기", role: .destructive) {
                            removeAction()
                        }
                    } label: {
                        if profileId == content.writerId {
                            Image(icon: .detailVertical)
                                .resizable()
                                .growIconColor(.textAlt)
                                .frame(size: 28)
                                .growBackground(.background)
                        }
                    }
                }
            }
            .padding(12)
        }
    }
}
