import SwiftUI
import DesignSystem
import BaseService
import MyDesignSystem
import DI

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
