import Foundation
import InfoServiceInterface
import DesignSystem

public final class ProfileDetailViewModel: ObservableObject {
    
    enum FetchFlow {
        case fetching
        case success
        case failure
    }
    
    // MARK: - UseCases
    private let getGithubUseCase: any GetGithubUseCase
    private let getProfileUseCase: any GetProfileUseCase
    private let getSolvedacUseCase: any GetSolvedacUseCase
    
    // MARK: - Properties
    private let memberId: Int
    
    // MARK: - States
    @Published var profile: Profile?
    @Published var profileFlow: FetchFlow = .fetching
    @Published var github: Github?
    @Published var githubFlow: FetchFlow = .fetching
    @Published var solvedac: Solvedav?
    @Published var solvedacFlow: FetchFlow = .fetching
    
    @Published var chartInfo: ChartInfo?
    @Published var selectedChart: ChartType = .github
    
    public init(
        getGithubUseCase: any GetGithubUseCase,
        getProfileUseCase: any GetProfileUseCase,
        getSolvedacUseCase: any GetSolvedacUseCase,
        memberId: Int
    ) {
        self.getGithubUseCase = getGithubUseCase
        self.getProfileUseCase = getProfileUseCase
        self.getSolvedacUseCase = getSolvedacUseCase
        self.memberId = memberId
    }
    
    @MainActor
    func fetchProfile() async {
        profile = try? await getProfileUseCase()
        guard let profile else { return }
        // handle solvedac
        let solvedavId = profile.socialAccounts.first { $0.socialType == .SOLVED_AC }
        guard let solvedavId else {
            solvedacFlow = .failure
            return
        }
        do {
            solvedac = try await getSolvedacUseCase(name: solvedavId.socialId)
            solvedacFlow = .success
        } catch {
            solvedacFlow = .failure
        }
        
        // handle github
        let githubId = profile.socialAccounts.first { $0.socialType == .GITHUB }
        guard let githubId else {
            githubFlow = .failure
            return
        }
        do {
            github = try await getGithubUseCase(name: githubId.socialId)
            githubFlow = .success
        } catch {
            githubFlow = .failure
        }
    }
}
