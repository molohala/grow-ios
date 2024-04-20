import Foundation
import InfoServiceInterface

final class ProfileViewModel: ObservableObject {
    
    enum Flow {
        case fetching
        case success
        case failure
    }
    
    // MARK: - UseCases
    private let getGithubUseCase: any GetGithubUseCase
    private let getSolvedavUseCase: any GetSolvedacUseCase
    
    // MARK: - Properties
    @Published var github: Github?
    @Published var githubFlow: Flow = .fetching
    @Published var solvedac: Solvedav?
    @Published var solvedacFlow: Flow = .fetching
    
    init(
        getGithubUseCase: any GetGithubUseCase,
        getSolvedavUseCase: any GetSolvedacUseCase
    ) {
        self.getGithubUseCase = getGithubUseCase
        self.getSolvedavUseCase = getSolvedavUseCase
    }
    
    @MainActor
    func fetchInfo() async {
        do {
            
        } catch {
            
        }
    }
}
