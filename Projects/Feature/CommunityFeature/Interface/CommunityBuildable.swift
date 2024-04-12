import SwiftUI
import CommunityServiceInterface

public protocol CommunityBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
    
    associatedtype Cell: View
    func makeCommunityCell(
        community: Community,
        action: @escaping () -> Void
    ) -> Cell
}
