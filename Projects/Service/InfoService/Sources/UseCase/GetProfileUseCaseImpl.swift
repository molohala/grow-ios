import InfoServiceInterface

public class GetProfileUseCaseImpl: GetProfileUseCase {
    private let infoRepository: any InfoRepository
    public init(infoRepository: any InfoRepository) {
        self.infoRepository = infoRepository
    }
    public func callAsFunction() async throws -> Profile {
        try await infoRepository.getProfile()
    }
}
