import LanguageServiceInterface

final class GetLanguagesByMemberIdUseCaseImpl: GetLanguagesByMemberIdUseCase {
    private let languageRepository: any LanguageRepository
    init(languageRepository: any LanguageRepository) {
        self.languageRepository = languageRepository
    }
    func callAsFunction(memberId: Int) async throws -> [Language] {
        try await languageRepository.getLanguagesByMemberId(memberId: memberId)
    }
}
