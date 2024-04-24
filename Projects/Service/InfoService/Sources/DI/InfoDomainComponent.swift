import NeedleFoundation
import InfoServiceInterface

public protocol InfoDomainDependency: Dependency {}

public final class InfoDomainComponent: Component<InfoDomainDependency>, InfoDomainBuildable {
  
    public var getSolvedacUseCase: GetSolvedacUseCase {
        shared {
            GetSolvedacUseCaseImpl(infoRepository: infoRepository)
        }
    }
    
    public var getGithubUseCase: GetGithubUseCase {
        shared {
            GetGithubUseCaseImpl(infoRepository: infoRepository)
        }
    }
    public var registerSolvedavUseCase: RegisterSolvedacUseCase {
        shared {
            RegisterSolvedacUseCaseImpl(infoRepository: infoRepository)
        }
    }
    
    public var registerGithubUseCase: RegisterGithubUseCase {
        shared {
            RegisterGithubUseCaseImpl(infoRepository: infoRepository)
        }
    }
    
    public var getProfileUseCase: GetProfileUseCase {
        shared {
            GetProfileUseCaseImpl(infoRepository: infoRepository)
        }
    }
    
    
    public var infoRepository: InfoRepository {
        shared {
            InfoRepositoryImpl(infoDataSource: infoDataSource)
        }
    }
    
    var infoDataSource: InfoDataSource {
        shared {
            InfoDataSourceImpl()
        }
    }
    
}
