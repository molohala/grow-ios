import SwiftUI
import DesignSystem
import CommunityServiceInterface

struct ForumPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                GrowForumCell(forum: .init(community: .init(communityId: 1, content: "정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다", createdAt: .now, like: 311, writerId: 1, writerName: "이강현", liked: true), recentComment: nil), profileId: 1, likeAction: {}, removeAction: {}, editAction: {}, action: {
                    print("Hello")
                })
                GrowForumCellShimmer()
            }
            .padding(8)
        }
        .myBackground(.backgroundAlt)
    }
}
