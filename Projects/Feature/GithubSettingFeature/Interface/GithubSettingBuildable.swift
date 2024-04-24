import SwiftUI

public protocol GithubSettingBuildable {
    associatedtype ViewType: View
    func makeView(_ githubId: String) -> ViewType
}
