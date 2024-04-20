import InfoServiceInterface

class GetSolvedacUseCaseImpl: GetSolvedacUseCase {
    
    private let infoRepository: any InfoRepository
    
    init(infoRepository: any InfoRepository) {
        self.infoRepository = infoRepository
    }
    
    func callAsFunction(name: String) async throws -> Solvedav {
        try await infoRepository.getSolvedav(name: name)
    }
}
