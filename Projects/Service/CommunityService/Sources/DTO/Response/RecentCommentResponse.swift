import CommunityServiceInterface

struct RecentCommentResponse: Decodable {
    let commentId: Int
    let content: String
    let createdAt: String
    let memberId: Int
    let name: String
}

extension RecentCommentResponse {
    func toDomain() -> RecentComment {
        RecentComment(
            commentId: commentId,
            content: content,
            createdAt: createdAt.date ?? .now, 
            memberId: memberId,
            name: name
        )
    }
}
