import Foundation
import CommunityServiceInterface

public final class CommunityEditViewModel: ObservableObject {
    
    private let patchCommunityUseCase: any PatchCommunityUseCase
    
    enum Flow: String {
        case idle
        case fetching
        case success
        case failure = "수정에 실패했습니다"
        case empty = "내용을 입력해 주세요"
    }
    
    @Published var content: String
    @Published var flow: Flow = .idle
    
    private let community: CommunityContent
    
    public init(
        patchCommunityUseCase: any PatchCommunityUseCase,
        community: CommunityContent
    ) {
        self.patchCommunityUseCase = patchCommunityUseCase
        self.community = community
        self.content = community.content
    }
    
    @MainActor
    func createCommunity() async {
        
        guard !content.isEmpty else {
            flow = .empty
            return
        }
        
        flow = .fetching
        
        do {
            try await patchCommunityUseCase(.init(content: content, id: community.communityId))
            flow = .success
        } catch {
            flow = .failure
        }
    }
}
