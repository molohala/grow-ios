import SwiftUI
import DesignSystem
import CommunityServiceInterface
import MyDesignSystem

struct ForumPreview: View {
    
    private let forum: Community = .init(
        community: .init(
            communityId: 1,
            content: "정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다정말정말 좋습니다",
            createdAt: .now,
            like: 311,
            writerId: 1,
            writerName: "이강현",
            liked: true
        ),
        recentComment: nil
    )
    
    var body: some View {
        ScrollView {
            VStack {
                GrowForumCell(
                    forum: forum,
                    profileId: 1,
                    likeAction: {},
                    removeAction: {},
                    editAction: {}, 
                    reportAction: {},
                    blockAction: {},
                    action: {
                        print("Hello")
                    }
                )
                GrowForumCellShimmer()
            }
            .padding(8)
        }
        .myBackground(.backgroundAlt)
    }
}
