import SwiftUI

public protocol CommunityDetailBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
