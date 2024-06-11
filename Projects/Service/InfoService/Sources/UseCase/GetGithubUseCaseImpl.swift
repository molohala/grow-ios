import InfoServiceInterface

class GetGithubUseCaseImpl: GetGithubUseCase {
    
    private let infoRepository: any InfoRepository
    
    init(infoRepository: any InfoRepository) {
        self.infoRepository = infoRepository
    }
    func callAsFunction(name: String) async throws -> Github {
        try await infoRepository.getGithub(name: name)
    }
}
