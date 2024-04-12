public protocol PatchCommunityUseCase {
    func callAsFunction(_ req: PatchCommunityRequest) async throws
}
