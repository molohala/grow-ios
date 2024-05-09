import InfoServiceInterface

public class PatchMyProfileUseCaseImpl: PatchMyProfileUseCase {
    private let infoRepository: any InfoRepository
    public init(infoRepository: any InfoRepository) {
        self.infoRepository = infoRepository
    }
    public func callAsFunction(_ req: PatchMyProfileRequest) async throws {
        try await infoRepository.patchMyProfile(req)
    }
}
