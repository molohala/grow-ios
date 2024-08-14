import SwiftUI
import CommunityServiceInterface
import MyDesignSystem
import OpenGraph

public struct GrowForumCell: View {
    
    public enum Action {
        case like
        case remove
        case edit
        case report
        case block
        case click
        case updateImageOpenGraph(OpenGraph?)
    }
    
    private let forum: Community
    private let profileId: Int
    private let action: (Action) async -> Void
    
    private var me: Bool {
        profileId == forum.community.writerId
    }
    
    private var links: [String] {
        forum.community.content.links
    }
    
    public init(
        forum: Community,
        profileId: Int,
        action: @escaping (Action) async -> Void
    ) {
        self.forum = forum
        self.profileId = profileId
        self.action = action
    }
    
    public var body: some View {
        let content = forum.community
        let recentComment = forum.recentComment
        
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
                Menu {
                    if me {
                        Button("수정하기") {
                            Task {
                                await action(.edit)
                            }
                        }
                        Button("삭제하기", role: .destructive) {
                            Task {
                                await action(.remove)
                            }
                        }
                    } else {
                        Button("신고하기", role: .destructive) {
                            Task {
                                await action(.report)
                            }
                        }
                        Button("유저차단", role: .destructive) {
                            Task {
                                await action(.block)
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
                
                .onTapGesture {} // for stop propagation
            }
            Text(LocalizedStringKey(content.content))
                .lineLimit(5)
                .myFont(.bodyR)
                .truncationMode(.tail)
                .myColor(.textNormal)
                .lineSpacing(5)
            if let link = links.first,
               let url = URL(string: link) {
                GrowLinkPreview(url: url, openGraph: .init {
                    forum.community.openGrpah
                } set: { openGraph in
                    Task {
                        await action(.updateImageOpenGraph(openGraph))
                    }
                })
            }
            MyLikeButton(like: content.like, isLiked: content.liked) {
                await action(.like)
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
        .onTapGesture {
            Task {
                await action(.click)
            }
        }
        .applyAnimation()
    }
}
