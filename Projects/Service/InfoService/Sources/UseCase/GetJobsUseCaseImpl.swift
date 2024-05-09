import InfoServiceInterface

public class GetJobsUseCaseImpl: GetJobsUseCase {
    private let infoRepository: any InfoRepository
    public init(infoRepository: any InfoRepository) {
        self.infoRepository = infoRepository
    }
    public func callAsFunction() async throws -> [String] {
        try await infoRepository.getJobs()
    }
}
