import SwiftUI
import CommunityServiceInterface
import DesignSystem

struct CommentPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                GrowCommentCell(comment: .init(commentId: 1, content: "정말 좋습니다다다다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", createAt: .now, memberId: 1, name: "이강현"), profileId: 1) {}
                GrowCommentCell(comment: .init(commentId: 1, content: "정말 좋습니다다", createAt: .now, memberId: 3, name: "이강현"), profileId: 1) {}
                GrowCommentCellShimmer()
            }
        }
        .growBackground(.background)
    }
}
