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
    
    // MARK: - State
    @Published var communities: [Community]
    @Published var isfetchingCommunities = false
    @Published var page = 1
    @Published var selectedCommunity: Community?
    
    public init(
        getCommunitesUseCase: any GetCommunitiesUseCase,
        patchLikeUseCase: any PatchLikeUseCase,
        communities: [Community] = []
    ) {
        self.getCommunitesUseCase = getCommunitesUseCase
        self.patchLikeUseCase = patchLikeUseCase
        self.communities = communities
    }
    
    @MainActor
    public func fetchCommunities() async {
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
    
    @MainActor
    public func fetchNextCommunities() async {
        
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
    
    @MainActor
    public func patchLike(communityId: Int) async {
        do {
            try await patchLikeUseCase(communityId: communityId)
        } catch {
            
        }
    }
}
