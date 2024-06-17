import SwiftUI
import CommentServiceInterface
import DateUtil
import MyDesignSystem

public struct GrowCommentCell: View {
    
    private let comment: Comment
    private let profileId: Int
    private let reportAction: () -> Void
    private let removeAction: () -> Void
    
    public init(
        comment: Comment,
        profileId: Int,
        reportAction: @escaping () -> Void,
        removeAction: @escaping () -> Void
    ) {
        self.comment = comment
        self.profileId = profileId
        self.reportAction = reportAction
        self.removeAction = removeAction
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            HStack(alignment: .top, spacing: 8) {
                MyAvatar(type: .large)
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 4) {
                        Text(comment.name)
                            .myFont(.bodyB)
                            .myColor(.textNormal)
                        Text(comment.createdAt.timeAgo)
                            .myFont(.labelM)
                            .myColor(.textAlt)
                    }
                    Text(LocalizedStringKey(comment.content))
                        .applyOpenURL()
                        .myFont(.bodyR)
                        .myColor(.textNormal)
                        .lineSpacing(5)
                }
            }
            Spacer()
            Menu {
                if profileId == comment.memberId {
                    Button("신고하기", role: .destructive) {
                        reportAction()
                    }
                    Button("삭제하기", role: .destructive) {
                        removeAction()
                    }
                } else {
                    Button("신고하기", role: .destructive) {
                        reportAction()
                    }
                }
            } label: {
                Image(icon: .detailVertical)
                    .resizable()
                    .myIconColor(.textAlt)
                    .frame(size: 24)
            }
            .applyAnimation()
        }
        .padding(12)
    }
}
