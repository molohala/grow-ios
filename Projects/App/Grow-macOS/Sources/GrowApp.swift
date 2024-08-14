import SwiftUI
import DI

@main
struct GrowApp: App {
    
    init() {
        registerProviderFactories()
    }
    
    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
        }
    }
}
