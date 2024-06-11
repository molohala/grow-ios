import NeedleFoundation
import CommentServiceInterface

public protocol CommentDomainDependency: Dependency {}

public class CommentDomainComponent: Component<CommentDomainDependency>, CommentDomainBuildable {
    public var getCommentsUseCase: GetCommentsUseCase {
        shared {
            GetCommentsUseCaseImpl(commentRepository: commentRepository)
        }
    }
    
    public var createCommentUseCase: CreateCommentUseCase {
        shared {
            CreateCommentUseCaseImpl(commentRepository: commentRepository)
        }
    }
    
    public var patchCommentUseCase: PatchCommentUseCase {
        shared {
            PatchCommentUseCaseImpl(commentRepository: commentRepository)
        }
    }
    
    public var removeCommentUseCase: RemoveCommentUseCase {
        shared {
            RemoveCommentUseCaseImpl(commentRepository: commentRepository)
        }
    }
    
    public var reportCommentUseCase: ReportCommentUseCase {
        shared {
            ReportCommentUseCaseImpl(commentRepository: commentRepository)
        }
    }
    
    public var commentRepository: CommentRepository {
        shared {
            CommentRepositoryImpl(commentDataSource: commentDataSource)
        }
    }
    
    var commentDataSource: CommentDataSource {
        shared {
            CommentDataSourceImpl()
        }
    }
}
