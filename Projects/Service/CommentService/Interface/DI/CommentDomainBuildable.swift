public protocol CommentDomainBuildable {
    var getCommentsUseCase: any GetCommentsUseCase { get }
    var createCommentUseCase: any CreateCommentUseCase { get }
    var patchCommentUseCase: any PatchCommentUseCase { get }
    var removeCommentUseCase: any RemoveCommentUseCase { get }
}
