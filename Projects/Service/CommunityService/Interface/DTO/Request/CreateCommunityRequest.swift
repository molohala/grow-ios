public struct CreateCommunityRequest: Encodable {
    let content: String
    
    public init(content: String) {
        self.content = content
    }
}
