import Foundation
import InfoServiceInterface
import DesignSystem

public final class ProfileViewModel: ObservableObject {
    
    // MARK: - UseCases
    private let getGithubUseCase: any GetGithubUseCase
    private let getSolvedavUseCase: any GetSolvedacUseCase
    
    // MARK: - Properties
    
    @Published var chartInfo: ChartInfo?
    @Published var selectedChart: ChartType = .github
    
    public init(
        getGithubUseCase: any GetGithubUseCase,
        getSolvedavUseCase: any GetSolvedacUseCase
    ) {
        self.getGithubUseCase = getGithubUseCase
        self.getSolvedavUseCase = getSolvedavUseCase
    }
}
