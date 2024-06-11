import Foundation
import SwiftUI
import NeedleFoundation

public protocol RootBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
