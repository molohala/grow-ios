import SwiftUI
import CommunityServiceInterface

public protocol CommunityEditBuildable {
    associatedtype ViewType: View
    func makeView(communityContent: CommunityContent) -> ViewType
}
