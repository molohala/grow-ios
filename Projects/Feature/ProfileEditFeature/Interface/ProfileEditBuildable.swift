import SwiftUI

public protocol ProfileEditBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
