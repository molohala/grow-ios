import NeedleFoundation
import CommentServiceInterface

public protocol CommentDomainDependency {}

public class CommentDomainComponent: Component<CommentDomainDependency>, CommentDomainBuildable {
    public var getCommentsUseCase: GetCommentsUseCase {
        shared {
            GetCommentsUseCaseImpl(repository: commentRepository)
        }
    }
    
    public var createCommentUseCase: CreateCommentUseCase {
        shared {
            CreateCommentUseCaseImpl(repository: commentRepository)
        }
    }
    
    public var patchCommentUseCase: PatchCommentUseCase {
        shared {
            PatchCommentUseCaseImpl(repository: commentRepository)
        }
    }
    
    public var removeCommentUseCase: RemoveCommentUseCase {
        shared {
            RemoveCommentUseCaseImpl(repository: commentRepository)
        }
    }
    
    public var commentRepository: CommentRepository {
        shared {
            CommentRepositoryImpl(dataSource: commentDataSource)
        }
    }
    
    var commentDataSource: CommentDataSource {
        shared {
            CommentDataSourceImpl()
        }
    }
}
