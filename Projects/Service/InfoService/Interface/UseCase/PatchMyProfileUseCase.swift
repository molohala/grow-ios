public protocol PatchMyProfileUseCase {
    func callAsFunction(_ req: PatchMyProfileRequest) async throws
}
