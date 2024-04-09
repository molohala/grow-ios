import SwiftUI
import BaseFeature
import MainFeatureInterface
import SignInFeatureInterface

public struct RootView: View {
    
    @StateObject private var router = Router()
    @StateObject private var appState = AppState()
    
    private let mainBuildable: any MainBuildable
    private let signInBuildable: any SignInBuildable
    
    public init(
        mainBuildable: any MainBuildable,
        signInBuildable: any SignInBuildable
    ) {
        self.mainBuildable = mainBuildable
        self.signInBuildable = signInBuildable
    }
    
    public var body: some View {
        mainBuildable.makeView().eraseToAnyView()
            .environmentObject(router)
            .environmentObject(appState)
    }
}
