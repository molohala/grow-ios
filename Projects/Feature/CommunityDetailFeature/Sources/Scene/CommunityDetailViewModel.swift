import Foundation
import LikeServiceInterface
import CommentServiceInterface
import CommunityServiceInterface

public final class CommunityDetailViewModel: ObservableObject {
    
    private let getCommunityUseCase: any GetCommunityUseCase
    private let getCommentUseCase: any GetCommentsUseCase
    private let createCommentUseCase: any CreateCommentUseCase
    private let patchLikeUseCase: any PatchLikeUseCase
    
    // MARK: - Properties
    // community
    enum CommunityFlow {
        case fetching
        case failure
        case success
    }
    @Published var community: CommunityContent?
    @Published var communityFlow: CommunityFlow = .fetching
    private let communityId: Int
    
    // comment
    enum CommentFlow {
        case fetching
        case failure
        case success
    }
    @Published var comments: [Comment]?
    @Published var commentFlow: CommentFlow = .fetching
    @Published var comment = ""
    
    // create comment
    enum CreateCommentFlow {
        case idle
        case failure
        case success
    }
    @Published var createCommentFlow: CreateCommentFlow = .idle
    
    public init(
        getCommunityUseCase: any GetCommunityUseCase,
        getCommentUseCase: any GetCommentsUseCase,
        createCommentUseCase: any CreateCommentUseCase,
        patchLikeUseCase: any PatchLikeUseCase,
        communityId: Int
    ) {
        self.getCommunityUseCase = getCommunityUseCase
        self.getCommentUseCase = getCommentUseCase
        self.createCommentUseCase = createCommentUseCase
        self.patchLikeUseCase = patchLikeUseCase
        self.communityId = communityId
    }
    
    @MainActor
    func fetchCommunity() async {
        do {
            community = try await getCommunityUseCase(id: communityId)
            communityFlow = .success
        } catch {
            communityFlow = .failure
        }
    }
    
    @MainActor
    func fetchComments() async {
        do {
            comments = try await getCommentUseCase(id: communityId)
            commentFlow = .success
        } catch {
            communityFlow = .failure
        }
    }
    
    @MainActor
    func createComment() async {
        do {
            try await createCommentUseCase(.init(content: comment, communityId: communityId))
            comment = ""
            createCommentFlow = .success
        } catch {
            createCommentFlow = .failure
        }
        comments = try? await getCommentUseCase(id: communityId)
    }
    
    @MainActor
    func patchLike() async {
        do {
            try await patchLikeUseCase(communityId: communityId)
            guard var community = community else { return }
            community.like += community.liked ? -1 : 1
            community.liked.toggle()
        } catch {}
    }
}
