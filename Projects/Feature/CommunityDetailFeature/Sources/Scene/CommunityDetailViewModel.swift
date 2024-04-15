import Foundation
import CommunityServiceInterface

public final class CommunityDetailViewModel: ObservableObject {
    
    private let getCommunityUseCase: any GetCommunityUseCase
    
    @Published var community: Community? = nil
    @Published var flow: Flow = .fetching
    
    enum Flow {
        case fetching
        case failure
        case success
    }
    
    public init(getCommunityUseCase: any GetCommunityUseCase) {
        self.getCommunityUseCase = getCommunityUseCase
    }
    
    @MainActor
    func fetchCommunity(id: Int) async {
        do {
            community = try await getCommunityUseCase(id: id)
            flow = .success
        } catch {
            flow = .failure
        }
    }
}
