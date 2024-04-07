import SwiftUI

public protocol SignInBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
