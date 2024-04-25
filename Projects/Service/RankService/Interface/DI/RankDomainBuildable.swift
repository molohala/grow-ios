public protocol RankDomainBuildable {
    var getTotalGithubRankUseCase: any GetTotalGithubRankUseCase { get }
    var getTodayGithubRankUseCase: any GetTodayGithubRankUseCase { get }
    var getWeekGithubRankUseCase: any GetWeekGithubRankUseCase { get }
}
