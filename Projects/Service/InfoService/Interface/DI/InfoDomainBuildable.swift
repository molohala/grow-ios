public protocol InfoDomainBuildable {
    var getSolvedacUseCase: any GetSolvedacUseCase { get }
    var getGithubUseCase: any GetGithubUseCase { get }
}
