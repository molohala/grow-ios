import SwiftUI
import BaseFeature
import MainFeatureInterface
import SignInFeatureInterface
import AuthServiceInterface
import InfoServiceInterface
import DesignSystem

public struct RootView: View {
    
    @StateObject private var router = Router()
    @StateObject private var appState: AppState
    @StateObject private var colorProvider = ColorProvider(isDarkTheme: true)
    
    private let mainBuildable: any MainBuildable
    private let signInBuildable: any SignInBuildable
    private let infoDomainBuildable: any InfoDomainBuildable
    
    public init(
        mainBuildable: any MainBuildable,
        signInBuildable: any SignInBuildable,
        setTokenUseCase: any SetTokenUseCase,
        getTokenUseCase: any GetTokenUseCase,
        infoDomainBuilable: any InfoDomainBuildable
    ) {
        self.mainBuildable = mainBuildable
        self.signInBuildable = signInBuildable
        self._appState = StateObject(
            wrappedValue: AppState(
                setTokenUseCase: setTokenUseCase,
                getTokenUseCase: getTokenUseCase,
                getProfileUseCase: infoDomainBuilable.getProfileUseCase,
                getSolvedacUseCase: infoDomainBuilable.getSolvedacUseCase,
                getGithubUseCase: infoDomainBuilable.getGithubUseCase
            )
        )
        self.infoDomainBuildable = infoDomainBuilable
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
        .environmentObject(colorProvider)
        .task {
            await appState.fetchProfile()
        }
    }
}
