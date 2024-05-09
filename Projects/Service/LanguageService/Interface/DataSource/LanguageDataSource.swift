public protocol LanguageDataSource {
    func getMyLanguages() async throws -> [Language]
    func getLanguages() async throws -> [Language]
    func patchMyLanguages(_ req: PatchMyLanguagesRequest) async throws
}

