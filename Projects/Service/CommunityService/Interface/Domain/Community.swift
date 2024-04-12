import Foundation
import DateUtil

public struct Community: Equatable {
    public let communityId: Int
    public let content: String
    public let createdAt: Date
    public let like: Int
    public let writer: String
    
    public init(communityId: Int, content: String, createdAt: Date, like: Int, writer: String) {
        self.communityId = communityId
        self.content = content
        self.createdAt = createdAt
        self.like = like
        self.writer = writer
    }
}
