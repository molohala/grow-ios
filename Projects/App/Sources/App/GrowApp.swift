import SwiftUI
import DesignSystem
import BaseService
import MyDesignSystem

@main
struct GrowApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
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
