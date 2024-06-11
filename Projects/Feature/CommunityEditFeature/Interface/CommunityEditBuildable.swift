import SwiftUI

public protocol CommunityEditBuildable {
    associatedtype ViewType: View
    func makeView(forumId: Int) -> ViewType
}
