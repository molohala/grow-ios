import Foundation
import CommunityServiceInterface

public enum HomeDestination: Hashable {
    case profileDetail(memberId: Int)
    case communityDetail
    case communityEdit(forumId: Int)
}
