import SwiftUI

public protocol ProfileBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
