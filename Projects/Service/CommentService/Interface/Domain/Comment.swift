import Foundation

public struct Comment {
    public let commentId: Int
    public let content: String
    public let createAt: Date
    public let memberId: Int
    public let name: String
    
    public init(commentId: Int, content: String, createAt: Date, memberId: Int, name: String) {
        self.commentId = commentId
        self.content = content
        self.createAt = createAt
        self.memberId = memberId
        self.name = name
    }
}
