import SwiftUI

public protocol MainBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
