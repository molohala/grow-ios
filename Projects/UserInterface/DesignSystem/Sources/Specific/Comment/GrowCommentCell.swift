import SwiftUI
import CommentServiceInterface
import DateUtil

public struct GrowCommentCell: View {
    
    private let comment: Comment
    private let profileId: Int
    private let removeAction: () -> Void
    
    public init(
        comment: Comment,
        profileId: Int,
        removeAction: @escaping () -> Void
    ) {
        self.comment = comment
        self.profileId = profileId
        self.removeAction = removeAction
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            HStack(alignment: .top, spacing: 8) {
                GrowAvatar(type: .large)
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 4) {
                        Text(comment.name)
                            .growFont(.bodyB)
                            .growColor(.textNormal)
                        Text(comment.createdAt.timeAgo)
                            .growFont(.labelM)
                            .growColor(.textAlt)
                    }
                    Text(comment.content)
                        .applyOpenURL()
                        .growFont(.bodyR)
                        .growColor(.textNormal)
                        .lineSpacing(5)
                }
            }
            Spacer()
            if profileId == comment.memberId {
                Menu {
                    Button("삭제하기", role: .destructive) {
                        removeAction()
                    }
                } label: {
                    Image(icon: .detailVertical)
                        .resizable()
                        .growIconColor(.textAlt)
                        .frame(size: 24)
                }
                .applyAnimation()
            }
        }
        .padding(12)
    }
}
