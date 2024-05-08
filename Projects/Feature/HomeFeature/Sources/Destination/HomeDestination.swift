import Foundation
import CommunityServiceInterface

public enum HomeDestination: Hashable {
    case profileDetail(memberId: Int)
    case communityDetail(forumId: Int)
    case communityEdit(forumId: Int)
}
