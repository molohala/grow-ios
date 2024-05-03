import Foundation
import InfoServiceInterface
import BaseFeature

public final class GithubSettingViewModel: ObservableObject {
    @Published var githubId: String = ""
    private let registerGithubUseCase: any RegisterGithubUseCase
    
    @Published var completeFlow: FetchFlow<Bool> = .fetching
    
    public init(
        registerGithubUseCase: any RegisterGithubUseCase
    ) {
        self.registerGithubUseCase = registerGithubUseCase
    }
    
    @MainActor
    func completeSetting() async {
        do {
            completeFlow = .fetching
            try await registerGithubUseCase(.init(socialId: githubId))
            completeFlow = .success(true)
        } catch {
            completeFlow = .failure
        }
    }
}
