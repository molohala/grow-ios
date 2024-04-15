import Foundation
import CommunityServiceInterface

public final class CommunityCreateViewModel: ObservableObject {
    
    private let createCommunityUseCase: any CreateCommunityUseCase
    
    enum Flow: String {
        case idle
        case fetching
        case success
        case failure = "업로드에 실패했습니다"
        case empty = "내용을 입력해 주세요"
    }
    
    @Published var content = ""
    @Published var flow: Flow = .idle
    
    public init(
        createCommunityUseCase: any CreateCommunityUseCase
    ) {
        self.createCommunityUseCase = createCommunityUseCase
    }
    
    @MainActor
    func createCommunity() async {
        
        guard !content.isEmpty else {
            flow = .empty
            return
        }
        
        flow = .fetching
        
        do {
            try await createCommunityUseCase(.init(content: content))
            flow = .success
        } catch {
            flow = .failure
        }
    }
}
