import Foundation
import LikeServiceInterface
import CommentServiceInterface
import CommunityServiceInterface

public final class CommunityDetailViewModel: ObservableObject {
    
    // MARK: - Flow
    enum FetchFlow {
        case fetching
        case failure
        case success
    }
    
    enum IdleFlow {
        case idle
        case failure
        case success
    }
    
    // MARK: - UseCases
    private let getCommunityUseCase: any GetCommunityUseCase
    private let getCommentUseCase: any GetCommentsUseCase
    private let createCommentUseCase: any CreateCommentUseCase
    private let patchLikeUseCase: any PatchLikeUseCase
    private let removeCommunityUseCase: any RemoveCommunityUseCase
    private let removeCommentUseCase: any RemoveCommentUseCase
    
    // MARK: - Properties
    // init community
    @Published var community: CommunityContent?
    @Published var communityFlow: FetchFlow = .fetching
    private let communityId: Int
    
    // comment
    @Published var comments: [Comment]?
    @Published var commentFlow: FetchFlow = .fetching
    @Published var comment = ""
    
    // create comment
    @Published var createCommentFlow: IdleFlow = .idle
    
    // remove community
    @Published var removeCommunityFlow: IdleFlow = .idle
    @Published var showRemovingCommunity = false
    
    // remove comment
    @Published var removeCommentFlow: IdleFlow = .idle
    @Published var showRemovingComment = false
    @Published var selectedRemovingComment: Comment?
    
    public init(
        getCommunityUseCase: any GetCommunityUseCase,
        getCommentUseCase: any GetCommentsUseCase,
        createCommentUseCase: any CreateCommentUseCase,
        patchLikeUseCase: any PatchLikeUseCase,
        removeCommunityUseCase: any RemoveCommunityUseCase,
        removeCommentUseCase: any RemoveCommentUseCase,
        communityId: Int
    ) {
        self.getCommunityUseCase = getCommunityUseCase
        self.getCommentUseCase = getCommentUseCase
        self.createCommentUseCase = createCommentUseCase
        self.patchLikeUseCase = patchLikeUseCase
        self.removeCommunityUseCase = removeCommunityUseCase
        self.removeCommentUseCase = removeCommentUseCase
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
            self.community = community
        } catch {}
    }
    
    @MainActor
    func removeCommuntiy() async {
        do {
            try await removeCommunityUseCase(id: communityId)
            removeCommunityFlow = .success
        } catch {
            removeCommunityFlow = .failure
        }
    }
    
    @MainActor
    func removeComment() async {
        guard let selectedRemovingComment else {
            removeCommentFlow = .failure
            return
        }
        do {
            try await removeCommentUseCase(id: selectedRemovingComment.commentId)
            await fetchComments()
            removeCommentFlow = .success
        } catch {
            removeCommentFlow = .failure
        }
    }
}
