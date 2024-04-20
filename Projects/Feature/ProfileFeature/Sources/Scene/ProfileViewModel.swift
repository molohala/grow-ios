import Foundation
import InfoServiceInterface
import DesignSystem

public final class ProfileViewModel: ObservableObject {
    
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
    
    @Published var chartInfo: ChartInfo?
    @Published var selectedChart: ChartType = .baekjoon
    
    public init(
        getGithubUseCase: any GetGithubUseCase,
        getSolvedavUseCase: any GetSolvedacUseCase
    ) {
        self.getGithubUseCase = getGithubUseCase
        self.getSolvedavUseCase = getSolvedavUseCase
    }
    
    @MainActor
    func fetchGithub() async {
        githubFlow = .fetching
        do {
            github = try await getGithubUseCase()
            guard let github else { return }
            chartInfo = github.weekCommits.githubWeekChartInfo
            githubFlow = .success
        } catch {
            githubFlow = .failure
        }
    }
    
    @MainActor
    func fetchSolvedac() async {
        solvedacFlow = .fetching
        do {
            solvedac = try await getSolvedavUseCase()
            
            solvedacFlow = .success
        } catch {
            solvedacFlow = .failure
        }
    }
}
