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

public extension [Commit] {
    var githubWeekChartInfo: ChartInfo {
        .init(
            title: "\(self.map { $0.contributionCount }.reduce(0, +))",
            subtitle: "이번주에 한 커밋",
            subject: ChartType.github.rawValue,
            chartData: .init(
                data: self.map { ($0.date.monthPerDay ?? "", y: $0.contributionCount) },
                color: .orange500
            )
        )
    }
}

public extension [Solve] {
    var baekjoonWeekChartInfo: ChartInfo {
        .init(
            title: "\(self.map { $0.solvedCount }.reduce(0, +))",
            subtitle: "이번주에 푼 문제",
            subject: ChartType.github.rawValue,
            chartData: .init(
                data: self.map { ($0.date.monthPerDay ?? "", y: $0.solvedCount) },
                color: .orange500
            )
        )
    }
}
