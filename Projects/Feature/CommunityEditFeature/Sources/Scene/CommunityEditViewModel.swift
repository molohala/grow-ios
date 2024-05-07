import Foundation
import CommunityServiceInterface
import BaseFeature

public final class CommunityEditViewModel: ObservableObject {
    
    // MARK: - UseCases
    private let patchCommunityUseCase: any PatchCommunityUseCase
    private let getCommunityUseCase: any GetCommunityUseCase
    
    // MARK: - States
    @Published var content: String = ""
    @Published var patchForumFlow: FetchFlow<Bool> = .fetching
    @Published var showNoContentDialog = false
    
    private let forumId: Int
    
    public init(
        patchCommunityUseCase: any PatchCommunityUseCase,
        getCommunityUseCase: any GetCommunityUseCase,
        forumId: Int
    ) {
        self.patchCommunityUseCase = patchCommunityUseCase
        self.getCommunityUseCase = getCommunityUseCase
        self.forumId = forumId
    }
    
    @MainActor
    func fetchForum() async {
        guard let forum = try? await getCommunityUseCase(id: forumId) else { return }
        content = forum.content
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
