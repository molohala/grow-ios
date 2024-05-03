import Foundation
import LikeServiceInterface
import CommentServiceInterface
import CommunityServiceInterface
import BaseFeature

public final class CommunityDetailViewModel: ObservableObject {
    
    // MARK: - UseCases
    private let getCommunityUseCase: any GetCommunityUseCase
    private let getCommentUseCase: any GetCommentsUseCase
    private let createCommentUseCase: any CreateCommentUseCase
    private let patchLikeUseCase: any PatchLikeUseCase
    private let removeCommunityUseCase: any RemoveCommunityUseCase
    private let removeCommentUseCase: any RemoveCommentUseCase
    
    // MARK: - Properties
    // init community
    @Published var community: FetchFlow<CommunityContent> = .fetching
    private let communityId: Int
    
    // comment
    @Published var comments: FetchFlow<[Comment]> = .fetching
    @Published var currentComment = ""
    
    // create comment
    @Published var createCommentFlow: FetchFlow<Bool> = .fetching
    
    // remove community
    @Published var removeCommunityFlow: FetchFlow<Bool> = .fetching
    @Published var showRemovingCommunity = false
    
    // remove comment
    @Published var removeCommentFlow: FetchFlow<Bool> = .fetching
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
            community = .fetching
            let community = try await getCommunityUseCase(id: communityId)
            self.community = .success(community)
        } catch {
            community = .failure
        }
    }
    
    @MainActor
    func fetchComments() async {
        do {
            comments = .fetching
            let comments = try await getCommentUseCase(id: communityId)
            self.comments = .success(comments)
        } catch {
            community = .failure
        }
    }
    
    @MainActor
    func createComment() async {
        do {
            createCommentFlow = .fetching
            try await createCommentUseCase(.init(content: currentComment, communityId: communityId))
            currentComment = ""
            createCommentFlow = .success(true)
        } catch {
            createCommentFlow = .failure
        }
        await fetchComments()
    }
    
    @MainActor
    func patchLike() async {
        do {
            try await patchLikeUseCase(communityId: communityId)
            guard case .success(var data) = community else {
                return
            }
            data.like += data.liked ? -1 : 1
            data.liked.toggle()
            self.community = community
        } catch {}
    }
    
    @MainActor
    func removeCommuntiy() async {
        do {
            try await removeCommunityUseCase(id: communityId)
            removeCommunityFlow = .success(true)
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
            removeCommentFlow = .success(true)
        } catch {
            removeCommentFlow = .failure
        }
    }
}
