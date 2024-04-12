public protocol GetCommunityiesUseCase {
    func callAsFunction(_ req: PageRequest) async throws -> [Community]
}
