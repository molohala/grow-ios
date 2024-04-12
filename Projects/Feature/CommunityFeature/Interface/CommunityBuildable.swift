import SwiftUI
import CommunityServiceInterface

public protocol CommunityBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
