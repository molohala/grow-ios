import CommunityServiceInterface

public final class ReportCommunityUseCaseImpl: ReportCommunityUseCase {
    
    private let repository: CommunityRepository
    
    init(repository: CommunityRepository) {
        self.repository = repository
    }
    public func callAsFunction(id: Int, _ req: ReportCommunityRequest) async throws {
        try await repository.reportCommunity(id: id, req)
    }
}
