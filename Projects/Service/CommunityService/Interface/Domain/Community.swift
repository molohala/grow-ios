import Foundation
import DateUtil

public struct Community: Hashable {
    public static func == (lhs: Community, rhs: Community) -> Bool {
        lhs.community.communityId == rhs.community.communityId
    }
    
    public var community: CommunityContent
    public var recentComment: RecentComment?
    
    public init(community: CommunityContent, recentComment: RecentComment?) {
        self.community = community
        self.recentComment = recentComment
    }
}
