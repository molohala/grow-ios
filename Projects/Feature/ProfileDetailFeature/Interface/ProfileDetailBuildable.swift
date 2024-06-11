import SwiftUI

public protocol ProfileDetailBuildable {
    associatedtype ViewType: View
    func makeView(memberId: Int) -> ViewType
}
