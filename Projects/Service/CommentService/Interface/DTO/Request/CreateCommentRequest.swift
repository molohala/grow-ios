public struct CreateCommentRequest: Encodable {
    let content: String
    let communityId: Int
    
    public init(content: String, communityId: Int) {
        self.content = content
        self.communityId = communityId
    }
}
