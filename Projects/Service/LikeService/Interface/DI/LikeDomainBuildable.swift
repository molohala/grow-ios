public protocol LikeDomainBuildable {
    var getLikeCountUseCase: any GetLikeCountUseCase { get }
    var patchLikeUseCase: any PatchLikeUseCase { get }
}
