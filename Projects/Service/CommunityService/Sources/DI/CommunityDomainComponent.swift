import NeedleFoundation
import CommunityServiceInterface

public protocol CommunityDomainDependency: Dependency {}

public final class CommunityDomainComponent: Component<CommunityDomainDependency>, CommunityDomainBuildable {
    
    public var getCommunitiesUseCase: GetCommunitiesUseCase {
        shared {
            GetCommunitiesUseCaseImpl(repository: communityRepository)
        }
    }
    
    public var createCommunityUseCase: CreateCommunityUseCase {
        shared {
            CreateCommunityUseCaseImpl(repository: communityRepository)
        }
    }
    
    public var patchCommunityUseCase: PatchCommunityUseCase {
        shared {
            PatchCommunityUseCaseImpl(repository: communityRepository)
        }
    }
    
    public var getCommunityUseCase: GetCommunityUseCase {
        shared {
            GetCommunityUseCaseImpl(repository: communityRepository)
        }
    }
    
    public var removeCommunityUseCase: RemoveCommunityUseCase {
        shared {
            RemoveCommunityUseCaseImpl(repository: communityRepository)
        }
    }
    
    public var communityRepository: CommunityRepository {
        shared {
            CommunityRepositoryImpl(dataSource: dataSource)
        }
    }
    
    var dataSource: CommunityDataSource {
        shared {
            CommunityDataSourceImpl()
        }
    }
}
