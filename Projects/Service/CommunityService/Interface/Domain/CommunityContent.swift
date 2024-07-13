import Foundation
import OpenGraph

extension OpenGraph: Equatable {
    public static func == (lhs: OpenGraph, rhs: OpenGraph) -> Bool {
        lhs.source == rhs.source
    }
}

public struct CommunityContent: Equatable {
    public let communityId: Int
    public let content: String
    public let createdAt: Date
    public var like: Int
    public let writerId: Int
    public let writerName: String
    public var liked: Bool
    public var openGrpah: OpenGraph?
    
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

public extension CommunityContent {
    static var dummy: [CommunityContent] = [
        .init(communityId: 0, content: "", createdAt: .now, like: 0, writerId: 1, writerName: "노영재", liked: true),
        .init(communityId: 1, content: "", createdAt: .now, like: 0, writerId: 1, writerName: "노영재", liked: true),
        .init(communityId: 2, content: "", createdAt: .now, like: 0, writerId: 1, writerName: "노영재", liked: false),
        .init(communityId: 3, content: "", createdAt: .now, like: 0, writerId: 1, writerName: "노영재", liked: true)
    ]
}
