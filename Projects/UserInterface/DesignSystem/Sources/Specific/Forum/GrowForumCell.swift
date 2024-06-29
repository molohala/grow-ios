import SwiftUI
import CommunityServiceInterface
import MyDesignSystem

public struct GrowForumCell: View {
    
    private let forum: Community
    private let profileId: Int
    private let likeAction: () async -> Void
    private let removeAction: () async -> Void
    private let editAction: () async -> Void
    private let reportAction: () async -> Void
    private let blockAction: () async -> Void
    private let action: () async -> Void
    
    private var me: Bool {
        profileId == forum.community.writerId
    }
    
    public init(
        forum: Community,
        profileId: Int,
        likeAction: @escaping () async -> Void,
        removeAction: @escaping () async -> Void,
        editAction: @escaping () async -> Void,
        reportAction: @escaping () async -> Void,
        blockAction: @escaping() async -> Void,
        action: @escaping () async -> Void
    ) {
        self.forum = forum
        self.profileId = profileId
        self.likeAction = likeAction
        self.removeAction = removeAction
        self.editAction = editAction
        self.reportAction = reportAction
        self.blockAction = blockAction
        self.action = action
    }
    
    public var body: some View {
        
        let content = forum.community
        let recentComment = forum.recentComment
        
        ZStack(alignment: .top) {
            Button {
                Task {
                    await action()
                }
            } label: {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 8) {
                        MyAvatar(type: .medium)
                        VStack(alignment: .leading) {
                            Text(content.writerName)
                                .myFont(.bodyB)
                                .myColor(.textNormal)
                            Text(content.createdAt.timeAgo)
                                .myFont(.labelM)
                                .myColor(.textAlt)
                        }
                        Spacer()
                    }
                    Text(LocalizedStringKey(content.content))
                        .lineLimit(5)
                        .myFont(.bodyR)
                        .truncationMode(.tail)
                        .myColor(.textNormal)
                        .lineSpacing(5)
                    MyLikeButton(like: content.like, isLiked: content.liked) {
                        await likeAction()
                    }
                    if let recentComment {
                        MyDivider()
                        HStack(spacing: 4) {
                            Text(recentComment.name)
                                .myFont(.labelB)
                                .myColor(.textNormal)
                            Text(recentComment.content)
                                .applyOpenURL()
                                .myColor(.textNormal)
                                .myFont(.labelR)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            Text(recentComment.createdAt.timeAgo)
                                .myFont(.labelM)
                                .myColor(.textAlt)
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
                        if me {
                            Button("수정하기") {
                                Task {
                                    await editAction()
                                }
                            }
                            Button("삭제하기", role: .destructive) {
                                Task {
                                    await removeAction()
                                }
                            }
                        } else {
                            Button("신고하기", role: .destructive) {
                                Task {
                                    await reportAction()
                                }
                            }
                            Button("유저차단", role: .destructive) {
                                Task {
                                    await blockAction()
                                }
                            }
                        }
                    } label: {
                        Image(icon: .detailVertical)
                            .resizable()
                            .myIconColor(.textAlt)
                            .frame(size: 28)
                            .myBackground(.background)
                    }
                }
            }
            .padding(12)
        }
    }
}
