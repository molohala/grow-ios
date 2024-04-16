import SwiftUI
import CommunityServiceInterface

public protocol CommunityEditBuildable {
    associatedtype ViewType: View
    func makeView(community: Community) -> ViewType
}
