public protocol InfoDomainBuildable {
    var getSolvedacUseCase: any GetSolvedacUseCase { get }
    var getGithubUseCase: any GetGithubUseCase { get }
    var registerSolvedavUseCase: any RegisterSolvedacUseCase { get}
    var registerGithubUseCase: any RegisterGithubUseCase { get }
    var getProfileUseCase: any GetProfileUseCase { get }
    var getProfileByIdUseCase: any GetProfileByIdUseCase { get }
}
