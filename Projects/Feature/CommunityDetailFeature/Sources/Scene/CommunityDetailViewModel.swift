import Foundation
import LikeServiceInterface
import CommentServiceInterface
import CommunityServiceInterface
import BaseFeature
import OpenGraph

public final class CommunityDetailViewModel: ObservableObject {
    
    // MARK: - UseCases
    private let getCommunityUseCase: any GetCommunityUseCase
    private let getCommentUseCase: any GetCommentsUseCase
    private let createCommentUseCase: any CreateCommentUseCase
    private let patchLikeUseCase: any PatchLikeUseCase
    private let removeCommunityUseCase: any RemoveCommunityUseCase
    private let removeCommentUseCase: any RemoveCommentUseCase
    private let reportCommentUseCase: any ReportCommentUseCase
    private let reportCommunityUseCase: any ReportCommunityUseCase
    
    // MARK: - Properties
    private let communityId: Int
    
    // MARK: - States
    @Published var community: FetchFlow<CommunityContent> = .fetching
    @Published var comments: FetchFlow<[Comment]> = .fetching
    @Published var currentComment = ""
    @Published var createCommentFlow: FetchFlow<Bool> = .fetching
    @Published var removeCommunityFlow: FetchFlow<Bool> = .fetching
    @Published var removeCommentFlow: FetchFlow<Bool> = .fetching
    @Published var selectedRemoveComment: Comment?
    @Published var selectedReportComment: Comment?
    @Published var reportCommentReason = ""
    @Published var reportCommunityReason = ""
    @Published var reportCommentFlow: FetchFlow<Bool> = .fetching
    
    public init(
        getCommunityUseCase: any GetCommunityUseCase,
        getCommentUseCase: any GetCommentsUseCase,
        createCommentUseCase: any CreateCommentUseCase,
        patchLikeUseCase: any PatchLikeUseCase,
        removeCommunityUseCase: any RemoveCommunityUseCase,
        removeCommentUseCase: any RemoveCommentUseCase,
        reportCommentUseCase: any ReportCommentUseCase,
        reportCommunityUseCase: any ReportCommunityUseCase,
        communityId: Int
    ) {
        self.getCommunityUseCase = getCommunityUseCase
        self.getCommentUseCase = getCommentUseCase
        self.createCommentUseCase = createCommentUseCase
        self.patchLikeUseCase = patchLikeUseCase
        self.removeCommunityUseCase = removeCommunityUseCase
        self.removeCommentUseCase = removeCommentUseCase
        self.reportCommentUseCase = reportCommentUseCase
        self.reportCommunityUseCase = reportCommunityUseCase
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
            self.community = .success(data)
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
        guard let selectedRemoveComment else {
            removeCommentFlow = .failure
            return
        }
        do {
            try await removeCommentUseCase(id: selectedRemoveComment.commentId)
            await fetchComments()
            removeCommentFlow = .success(true)
        } catch {
            removeCommentFlow = .failure
        }
    }
    
    @MainActor
    func reportComment() async {
        guard let selectedReportComment else {
            reportCommentFlow = .failure
            return
        }
        
        do {
            let request = ReportCommentRequest(reason: reportCommentReason)
            try await reportCommentUseCase(id: selectedReportComment.commentId, request)
            reportCommentFlow = .success(true)
        } catch {
            reportCommentFlow = .failure
        }
    }
    
    @MainActor
    func reportCommunity() async {
        
        do {
            let request = ReportCommunityRequest(reason: reportCommunityReason)
            try await reportCommunityUseCase(id: communityId, request)
            reportCommentFlow = .success(true)
        } catch {
            reportCommentFlow = .failure
        }
    }
    
    @MainActor
    func updateImageOpenGraph(_ openGraph: OpenGraph?) {
        if var data = community.data {
            data.openGrpah = openGraph
            community = .success(data)
        }
    }
}
