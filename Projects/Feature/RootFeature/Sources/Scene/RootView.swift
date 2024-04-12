import SwiftUI
import BaseFeature
import MainFeatureInterface
import SignInFeatureInterface
import AuthServiceInterface

public struct RootView: View {
    
    @StateObject private var router = Router()
    @StateObject private var appState: AppState
    
    private let mainBuildable: any MainBuildable
    private let signInBuildable: any SignInBuildable
    
    public init(
        mainBuildable: any MainBuildable,
        signInBuildable: any SignInBuildable,
        setTokenUseCase: any SetTokenUseCase,
        getTokenUseCase: any GetTokenUseCase
    ) {
        self.mainBuildable = mainBuildable
        self.signInBuildable = signInBuildable
        self._appState = StateObject(wrappedValue: AppState(setTokenUseCase: setTokenUseCase, getTokenUseCase: getTokenUseCase))
    }
    
    public var body: some View {
        Group {
            if appState.accessToken.isEmpty {
                signInBuildable.makeView().eraseToAnyView()
            } else {
                mainBuildable.makeView().eraseToAnyView()
            }
        }
        .environmentObject(router)
        .environmentObject(appState)
    }
}
