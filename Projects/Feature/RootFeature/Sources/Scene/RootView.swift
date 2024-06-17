import SwiftUI
import BaseFeature
import MainFeatureInterface
import SignInFeatureInterface
import AuthServiceInterface
import InfoServiceInterface
import LanguageServiceInterface
import DesignSystem
import MyDesignSystem

public struct RootView: View {
    
    @StateObject private var router = Router()
    @StateObject private var appState: AppState
    @StateObject private var colorProvider = ColorProvider(isDarkTheme: UserDefaults.standard.bool(forKey: "isDarkTheme"))
    
    private let mainBuildable: any MainBuildable
    private let signInBuildable: any SignInBuildable
    private let infoDomainBuildable: any InfoDomainBuildable
    private let languageDomainBuildable: any LanguageDomainBuildable
    
    public init(
        mainBuildable: any MainBuildable,
        signInBuildable: any SignInBuildable,
        setTokenUseCase: any SetTokenUseCase,
        getTokenUseCase: any GetTokenUseCase,
        infoDomainBuilable: any InfoDomainBuildable,
        languageDomainBuildable: any LanguageDomainBuildable
    ) {
        self.mainBuildable = mainBuildable
        self.signInBuildable = signInBuildable
        self.infoDomainBuildable = infoDomainBuilable
        self.languageDomainBuildable = languageDomainBuildable
        self._appState = StateObject(
            wrappedValue: AppState(
                setTokenUseCase: setTokenUseCase,
                getTokenUseCase: getTokenUseCase,
                getProfileUseCase: infoDomainBuilable.getProfileUseCase,
                getSolvedacUseCase: infoDomainBuilable.getSolvedacUseCase,
                getGithubUseCase: infoDomainBuilable.getGithubUseCase,
                getMyLanguagesUseCase: languageDomainBuildable.getMyLanguagesUseCase
            )
        )
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
        .onAppear {
            handleRefreshControl()
        }
        .onChange(of: colorProvider.isDarkTheme) { _ in
            handleRefreshControl()
        }
    }
    
    func handleRefreshControl() {
        let tintColor: UIColor = colorProvider.isDarkTheme ? .green : .black
        UIRefreshControl.appearance().tintColor = tintColor
    }
}
