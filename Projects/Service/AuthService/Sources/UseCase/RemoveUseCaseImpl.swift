import AuthServiceInterface

class RemoveUseCaseImpl: RemoveUseCase {
    private let authRepository: any AuthRepository
    
    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }
    func callAsFunction() async throws {
        try await authRepository.remove()
    }
}
