import SwiftUI

public protocol HomeBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
