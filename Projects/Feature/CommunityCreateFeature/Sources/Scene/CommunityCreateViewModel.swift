import Foundation
import CommunityServiceInterface
import BaseFeature

public final class CommunityCreateViewModel: ObservableObject {
    
    private let createCommunityUseCase: any CreateCommunityUseCase
    @Published var content = ""
    @Published var createForumFlow: FetchFlow<Bool> = .fetching
    @Published var showNoContentDialog = false
    
    public init(
        createCommunityUseCase: any CreateCommunityUseCase
    ) {
        self.createCommunityUseCase = createCommunityUseCase
    }
    
    @MainActor
    func createCommunity() async {
        guard !content.isEmpty else {
            showNoContentDialog = true
            return
        }
        do {
            createForumFlow = .fetching
            try await createCommunityUseCase(.init(content: content))
            createForumFlow = .success(true)
        } catch {
            createForumFlow = .failure
        }
    }
}
