import SwiftUI

public protocol BaekjoonSettingBuildable {
    associatedtype ViewType: View
    func makeView(_ baekjoonId: String) -> ViewType
}
