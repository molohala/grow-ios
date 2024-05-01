import NeedleFoundation
import RankServiceInterface

public protocol RankDomainDependency: Dependency {}

public final class RankDomainComponent: Component<RankDomainDependency>, RankDomainBuildable {
    
    public var getTotalGithubRankUseCase: GetTotalGithubRankUseCase {
        shared {
            GetTotalGithubRankUseCaseImpl(rankRepository: rankRepository)
        }
    }
    
    public var getTodayGithubRankUseCase: GetTodayGithubRankUseCase {
        shared {
            GetTodayGithubRankUseCaseImpl(rankRepository: rankRepository)
        }
    }
    
    public var getWeekGithubRankUseCase: GetWeekGithubRankUseCase {
        shared {
            GetWeekGithubRankUseCaseImpl(rankRepository: rankRepository)
        }
    }
    
    public var getTotalSolvedacRankUseCase: GetTotalSolvedacRankUseCase {
        shared {
            GetTotalSolvedacRankUseCaseImpl(rankRepository: rankRepository)
        }
    }
    
    public var getTodaySolvedacRankUseCase: GetTodaySolvedacRankUseCase {
        shared {
            GetTodaySolvedacRankUseCaseImpl(rankRepository: rankRepository)
        }
    }
    
    public var getWeekSolvedacRankUseCase: GetWeekSolvedacRankUseCase {
        shared {
            GetWeekSolvedacRankUseCaseImpl(rankRepository: rankRepository)
        }
    }
    
    public var rankRepository: any RankRepository {
        shared {
            RankRepositoryImpl(rankDataSource: rankDataSource)
        }
    }
    
    var rankDataSource: RankDataSource {
        shared {
            RankDataSourceImpl()
        }
    }
}
