import Foundation
import InfoServiceInterface

public final class GithubSettingViewModel: ObservableObject {
    @Published var githubId: String = ""
    private let registerGithubUseCase: any RegisterGithubUseCase
    
    enum Flow {
        case idle
        case fetching
        case success
        case failure
    }
    
    @Published var flow: Flow = .idle
    
    public init(
        registerGithubUseCase: any RegisterGithubUseCase,
        githubId: String
    ) {
        self.githubId = githubId
        self.registerGithubUseCase = registerGithubUseCase
    }
    
    @MainActor
    func completeSetting() async {
        flow = .fetching
        do {
            try await registerGithubUseCase(.init(socialId: githubId))
            flow = .success
        } catch {
            flow = .failure
        }
    }
}
