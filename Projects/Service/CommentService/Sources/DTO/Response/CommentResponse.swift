import Foundation
import CommentServiceInterface
import DateUtil

struct CommentResponse: Decodable {
    let commentId: Int
    let content: String
    let createdAt: String
    let memberId: Int
    let name: String
}

extension CommentResponse {
    func toDomain() -> Comment {
        Comment(
            commentId: commentId,
            content: content,
            createAt: createdAt.date ?? .now,
            memberId: memberId,
            name: name
        )
    }
}
