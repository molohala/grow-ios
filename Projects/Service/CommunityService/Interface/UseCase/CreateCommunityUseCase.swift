public protocol CreateCommunityUseCase {
    func callAsFunction(_ req: CreateCommunityRequest) async throws
}
