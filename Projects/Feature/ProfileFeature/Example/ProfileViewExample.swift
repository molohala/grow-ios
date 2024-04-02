import SwiftUI
import ProfileFeature

@main
struct ProfileViewExample: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ProfileView()
                    .background(Color.backgroundColor)
            }
        }
    }
}
