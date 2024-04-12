import NeedleFoundation
import LikeServiceInterface

public protocol LikeDomainDependency: Dependency {}

public class LikeDomainComponent: Component<LikeDomainDependency>, LikeDomainBuildable {
    public var getLikeCountUseCase: GetLikeCountUseCase {
        shared {
            GetLikeCountUseCaseImpl(repository: likeRepository)
        }
    }
    
    public var patchLikeUseCase: PatchLikeUseCase {
        shared {
            PatchLikeUseCaseImpl(repository: likeRepository)
        }
    }
    
    public var likeRepository: LikeRepository {
        shared {
            LikeRepositoryImpl(dataSource: likeDataSource)
        }
    }
    
    var likeDataSource: LikeDataSource {
        shared {
            LikeDataSourceImpl()
        }
    }
}
