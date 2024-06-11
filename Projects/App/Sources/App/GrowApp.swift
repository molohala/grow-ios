import SwiftUI
import DesignSystem
import BaseService

@main
struct GrowApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    init() {
        registerProviderFactories()
    }
    
    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
        }
    }
}
