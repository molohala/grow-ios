import Foundation
import LikeServiceInterface
import CommunityServiceInterface
import BaseFeature
import SwiftUI

public let pagingInterval = 10

public final class CommunityViewModel: ObservableObject {
    
    // MARK: - Properties
    private let getCommunitesUseCase: any GetCommunitiesUseCase
    private let patchLikeUseCase: any PatchLikeUseCase
    private let removeCommunityUseCase: any RemoveCommunityUseCase
    private let reportCommunityUseCase: any ReportCommunityUseCase
    
    // MARK: - State
    @Published var communities: FetchFlow<[Community]> = .fetching
    @Published var page = 1
    @Published var selectedCommunity: Community?
    @Published var removedCommunityFlow: FetchFlow<Bool> = .fetching
    @Published var selectedRemoveCommunity: Community?
    @Published var selectedReportCommunity: Community?
    @Published var reportCommunityReason = ""
    @Published var reportCommentFlow: FetchFlow<Bool> = .fetching
    
    public init(
        getCommunitesUseCase: any GetCommunitiesUseCase,
        patchLikeUseCase: any PatchLikeUseCase,
        removeCommunityUseCase: any RemoveCommunityUseCase,
        reportCommunityUseCase: any ReportCommunityUseCase
    ) {
        self.getCommunitesUseCase = getCommunitesUseCase
        self.patchLikeUseCase = patchLikeUseCase
        self.removeCommunityUseCase = removeCommunityUseCase
        self.reportCommunityUseCase = reportCommunityUseCase
    }
    
    @MainActor
    public func fetchCommunities() async {
        let nextPage = 1
        print("\(#function) - fetching ... nextPage: \(nextPage)")
        let request = PageRequest(page: nextPage, size: pagingInterval)
        
        do {
            let pagedCommunities = try await getCommunitesUseCase(request)
            communities = .success(pagedCommunities)

            if case .success(let communities) = communities,
                !communities.isEmpty {
                page = nextPage
            }
        } catch {
            communities = .failure
            page = 1
        }
    }
    
    @MainActor
    public func fetchNextCommunities() async {
        guard case .success(var communities) = communities else {
            communities = .failure
            return
        }
        let nextPage = communities.count / pagingInterval + 1
        let request = PageRequest(page: nextPage, size: pagingInterval)

        do {
            let pagedCommunities = try await getCommunitesUseCase(request)
            communities.append(contentsOf: pagedCommunities)
            self.communities = .success(communities)
        } catch {
            self.communities = .failure
            page = 1
        }
    }
    
    @MainActor
    public func patchLike(communityId: Int) async {
        guard case .success(var communities) = communities else {
            return
        }

        do {
            try await patchLikeUseCase(communityId: communityId)
            communities.enumerated().forEach { idx, i in
                if communityId == i.community.communityId {
                    communities[idx].community.like += i.community.liked ? -1 : 1
                    communities[idx].community.liked.toggle()
                }
            }
            self.communities = .success(communities)
        } catch {}
    }
    
    @MainActor
    public func removeCommunity() async {
        guard let selectedRemoveCommunity else {
            removedCommunityFlow = .failure
            return
        }
        do {
            removedCommunityFlow = .fetching
            try await removeCommunityUseCase(id: selectedRemoveCommunity.community.communityId)
            removedCommunityFlow = .success(true)
        } catch {
            removedCommunityFlow = .failure
        }
    }
    
    @MainActor
    func reportCommunity() async {
        
        guard let selectedReportCommunity else {
            return
        }
        
        do {
            let request = ReportCommunityRequest(reason: reportCommunityReason)
            try await reportCommunityUseCase(id: selectedReportCommunity.community.communityId, request)
            reportCommentFlow = .success(true)
        } catch {
            reportCommentFlow = .failure
        }
    }
}
