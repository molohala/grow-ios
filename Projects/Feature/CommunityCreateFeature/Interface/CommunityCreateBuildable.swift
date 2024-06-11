import SwiftUI

public protocol CommunityCreateBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
