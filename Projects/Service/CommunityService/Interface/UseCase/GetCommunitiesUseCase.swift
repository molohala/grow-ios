public protocol GetCommunitiesUseCase {
    func callAsFunction(_ req: PageRequest) async throws -> [Community]
}
