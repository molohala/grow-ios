public protocol RankDomainBuildable {
    var getTotalGithubRankUseCase: any GetTotalGithubRankUseCase { get }
    var getTodayGithubRankUseCase: any GetTodayGithubRankUseCase { get }
    var getWeekGithubRankUseCase: any GetWeekGithubRankUseCase { get }
    
    var getTotalSolvedacRankUseCase: any GetTotalSolvedacRankUseCase { get }
    var getTodaySolvedacRankUseCase: any GetTodaySolvedacRankUseCase { get }
    var getWeekSolvedacRankUseCase: any GetWeekSolvedacRankUseCase { get }
}
