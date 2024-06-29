import NeedleFoundation
import BlockServiceInterface

public protocol BlockDomainDependency: Dependency {}

public class BlockDomainComponent: Component<BlockDomainDependency>, BlockDomainBuildable {
    public var blockUseCase: any BlockUseCase {
        shared {
            BlockUseCaseImpl(repository: repository)
        }
    }
    
    public var allowUseCase: any AllowUseCase {
        shared {
            AllowUseCaseImpl(repository: repository)
        }
    }
    
    public var getAllBlockedUserUseCase: any GetAllBlockedUserUseCase {
        shared {
            GetAllBlockedUserUseCaseImpl(repository: repository)
        }
    }
    
    public var repository: any BlockRepository {
        shared {
            BlockRepositoryImpl(dataSource: dataSource)
        }
    }
    
    var dataSource: any BlockDataSource {
        shared {
            BlockDataSourceImpl()
        }
    }
}
