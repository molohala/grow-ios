import Foundation
import DateUtil

public struct Community: Equatable {
    public let communityId: Int
    public let content: String
    public let createdAt: Date
    public let like: Int
    public let writerId: Int
    public let writerName: String
    public var liked: Bool
    
    public init(
        communityId: Int,
        content: String,
        createdAt: Date,
        like: Int,
        writerId: Int,
        writerName: String,
        liked: Bool
    ) {
        self.communityId = communityId
        self.content = content
        self.createdAt = createdAt
        self.like = like
        self.writerId = writerId
        self.writerName = writerName
        self.liked = liked
    }
}

public extension Community {
    static var dummy: [Community] = [
        .init(communityId: 0, content: "", createdAt: .now, like: 0, writerId: 1, writerName: "노영재", liked: true),
        .init(communityId: 1, content: "", createdAt: .now, like: 0, writerId: 1, writerName: "노영재", liked: true),
        .init(communityId: 2, content: "", createdAt: .now, like: 0, writerId: 1, writerName: "노영재", liked: false),
        .init(communityId: 3, content: "", createdAt: .now, like: 0, writerId: 1, writerName: "노영재", liked: true)
    ]
}
