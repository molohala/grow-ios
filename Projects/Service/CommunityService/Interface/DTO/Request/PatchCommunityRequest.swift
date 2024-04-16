public struct PatchCommunityRequest: Encodable {
    public let content: String
    public let id: Int
    
    public init(content: String, id: Int) {
        self.content = content
        self.id = id
    }
}
