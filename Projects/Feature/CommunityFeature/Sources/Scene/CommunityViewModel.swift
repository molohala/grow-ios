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
    
    // MARK: - State
    @Published var communities: [Community]
    @Published var isfetchingCommunities = false
    @Published var page = 1
    @Published var selectedCommunity: Community?
    
    enum Flow {
        case idle
        case checking
        case fetching
        case success
        case failure
    }
    @Published var removedCommunityFlow: Flow = .idle
    @Published var removedCommunity: Community?
    
    public init(
        getCommunitesUseCase: any GetCommunitiesUseCase,
        patchLikeUseCase: any PatchLikeUseCase,
        removeCommunityUseCase: any RemoveCommunityUseCase,
        communities: [Community] = []
    ) {
        self.getCommunitesUseCase = getCommunitesUseCase
        self.patchLikeUseCase = patchLikeUseCase
        self.removeCommunityUseCase = removeCommunityUseCase
        self.communities = communities
    }
    
    @MainActor
    public func fetchCommunities() {
        Task {
            withAnimation {
                isfetchingCommunities = true
            }
            defer {
                withAnimation {
                    isfetchingCommunities = false
                }
            }
            do {
                let nextPage = 1
                print("\(#function) - fetching ... nextPage: \(nextPage)")
                let request = PageRequest(page: nextPage, size: pagingInterval)
                
                let pagedCommunities = try await getCommunitesUseCase(request)
                communities = pagedCommunities
                if !communities.isEmpty {
                    page = nextPage
                }
            } catch {
                communities = []
                page = 1
                print("❌ 커뮤니티 불러오기 실패")
            }
        }
    }
    
    @MainActor
    public func fetchNextCommunities() {
        Task {
            do {
                let nextPage = communities.count / pagingInterval + 1
                print("\(#function) - fetching ... nextPage: \(nextPage)")
                let request = PageRequest(page: nextPage, size: pagingInterval)
                
                let pagedCommunities = try await getCommunitesUseCase(request)
                communities.append(contentsOf: pagedCommunities)
            } catch {
                communities = []
                page = 1
                print("❌ 커뮤니티 페이징 실패")
            }
        }
    }
    
    @MainActor
    public func patchLike(communityId: Int) {
        Task {
            do {
                try await patchLikeUseCase(communityId: communityId)
                communities.enumerated().forEach { idx, i in
                    if communityId == i.community.communityId {
                        communities[idx].community.like += i.community.liked ? -1 : 1
                        communities[idx].community.liked.toggle()
                    }
                }
            } catch {}
        }
    }
    
    @MainActor
    public func removeCommunity() {
        Task {
            removedCommunityFlow = .fetching
            do {
                guard let removedCommunity else {
                    removedCommunityFlow = .failure
                    return
                }
                try await removeCommunityUseCase(id: removedCommunity.community.communityId)
                removedCommunityFlow = .success
            } catch {
                removedCommunityFlow = .failure
            }
        }
    }
}
