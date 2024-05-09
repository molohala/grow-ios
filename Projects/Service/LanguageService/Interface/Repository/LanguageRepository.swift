public protocol LanguageRepository {
    func getMyLanguages() async throws -> [Language]
    func getLanguages() async throws -> [Language]
    func getLanguagesByMemberId(memberId: Int) async throws -> [Language]
    func patchMyLanguages(_ req: PatchMyLanguagesRequest) async throws
}
