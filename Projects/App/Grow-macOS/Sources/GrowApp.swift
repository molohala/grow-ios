import SwiftUI
import DI
import MyDesignSystem

@main
struct GrowApp: App {
    
    init() {
        registerProviderFactories()
        Wanted.register()
    }
    
    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
        }
    }
}
