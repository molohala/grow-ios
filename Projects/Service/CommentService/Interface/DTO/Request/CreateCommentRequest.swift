public struct CreateCommentRequest: Encodable {
    let content: String
    let communityId: Int
}
