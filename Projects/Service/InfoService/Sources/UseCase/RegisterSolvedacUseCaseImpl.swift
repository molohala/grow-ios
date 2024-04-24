import InfoServiceInterface

public class RegisterSolvedacUseCaseImpl: RegisterSolvedacUseCase {
    private let infoRepository: any InfoRepository
    public init(infoRepository: any InfoRepository) {
        self.infoRepository = infoRepository
    }
    public func callAsFunction(_ req: SocialIdRequest) async throws {
        try await infoRepository.registerSolvedac(req)
    }
}
