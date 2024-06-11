public protocol GetLanguagesByMemberIdUseCase {
    func callAsFunction(memberId: Int) async throws -> [Language]
}
