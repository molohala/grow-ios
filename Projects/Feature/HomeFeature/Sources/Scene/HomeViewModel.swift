import Foundation
import CommunityServiceInterface

public final class HomeViewModel: ObservableObject {
    
    @Published var weekCommunities: [Community] = []
    
    public init() {
        
    }
    
}
