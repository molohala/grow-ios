import SwiftUI

public protocol BlockBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
