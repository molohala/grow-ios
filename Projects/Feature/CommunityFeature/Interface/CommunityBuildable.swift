import SwiftUI

public protocol CommunityBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
