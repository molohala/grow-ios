import SwiftUI
import GithubRankFeature

@main
struct GithubRankViewExample: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                GithubRankView(navigateToProfileEdit: {}, navigateToProfileDetail: {})
            }
        }
    }
}
