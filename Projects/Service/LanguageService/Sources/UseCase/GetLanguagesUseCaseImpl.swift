import LanguageServiceInterface

class GetLanguageUseCasesImpl: GetLanguagesUseCase {
    private let languageRepository: any LanguageRepository
    init(languageRepository: any LanguageRepository) {
        self.languageRepository = languageRepository
    }
    func callAsFunction() async throws -> [Language] {
        try await languageRepository.getLanguages()
    }
}
