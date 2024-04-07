import SwiftUI

public protocol GithubRankBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
