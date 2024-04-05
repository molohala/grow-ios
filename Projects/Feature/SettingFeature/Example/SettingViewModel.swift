import SwiftUI
import SettingFeature

@main
struct SettingViewModel: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SettingView(
                    navigateToProfileEditGithub: {},
                    navigateToProfileEditBaekjoon: {},
                    navigateToProfileEditJob: {}
                )
            }
        }
    }
}
