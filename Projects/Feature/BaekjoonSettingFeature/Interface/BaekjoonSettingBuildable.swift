import SwiftUI

public protocol BaekjoonSettingBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
