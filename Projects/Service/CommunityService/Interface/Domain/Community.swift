import Foundation
import DateUtil
import CommentServiceInterface

public struct Community {
    public var community: CommunityContent
    public var recentComment: RecentComment?
    
    public init(community: CommunityContent, recentComment: RecentComment?) {
        self.community = community
        self.recentComment = recentComment
    }
}
