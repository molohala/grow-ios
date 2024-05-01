import InfoServiceInterface

class GetProfileByIdUseCaseImpl: GetProfileByIdUseCase {
    
    private let infoRepository: any InfoRepository
    public init(infoRepository: any InfoRepository) {
        self.infoRepository = infoRepository
    }
    
    func callAsFunction(memberId: Int) async throws -> Profile {
        try await infoRepository.getProfile(memberId: memberId)
    }
}
