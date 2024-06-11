import SwiftUI

public protocol BaekjoonRankBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
