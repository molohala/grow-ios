import SwiftUI

public protocol SettingBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
