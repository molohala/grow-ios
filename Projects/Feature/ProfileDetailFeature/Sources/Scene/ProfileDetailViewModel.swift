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
        do {
            profileFlow = .fetching
            profile = try await getProfileUseCase()
            profileFlow = .success
        } catch {
            profileFlow = .failure
        }
    }
    
    @MainActor
    func fetchSolvedac() async {
        do {
            solvedacFlow = .fetching
            guard let profile, let solvedacId = (profile.socialAccounts.first { $0.socialType == .SOLVED_AC }) else {
                solvedacFlow = .failure
                return
            }
            solvedac = try await getSolvedacUseCase(name: solvedacId.socialId)
            solvedacFlow = .success
        } catch {
            solvedacFlow = .failure
        }
    }
    
    @MainActor
    func fetchGithub() async {
        do {
            githubFlow = .fetching
            guard let profile, let githubId = (profile.socialAccounts.first { $0.socialType == .GITHUB }) else {
                githubFlow = .failure
                return
            }
            github = try await getGithubUseCase(name: githubId.socialId)
            solvedacFlow = .success
        } catch {
            githubFlow = .failure
        }
    }
}
