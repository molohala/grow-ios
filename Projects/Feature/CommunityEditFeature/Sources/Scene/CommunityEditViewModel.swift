import Foundation
import CommunityServiceInterface
import BaseFeature

public final class CommunityEditViewModel: ObservableObject {
    
    private let patchCommunityUseCase: any PatchCommunityUseCase
    
    @Published var content: String = ""
    @Published var patchForumFlow: FetchFlow<Bool> = .fetching
    @Published var showNoContentDialog = false
    
    private let forumId: Int
    
    public init(
        patchCommunityUseCase: any PatchCommunityUseCase,
        forumId: Int
    ) {
        self.patchCommunityUseCase = patchCommunityUseCase
        self.forumId = forumId
    }
    
    @MainActor
    func patchCommunity() async {
        guard !content.isEmpty else {
            showNoContentDialog = true
            return
        }
        patchForumFlow = .fetching
        do {
            try await patchCommunityUseCase(.init(content: content, id: forumId))
            patchForumFlow = .success(true)
        } catch {
            patchForumFlow = .failure
        }
    }
}
