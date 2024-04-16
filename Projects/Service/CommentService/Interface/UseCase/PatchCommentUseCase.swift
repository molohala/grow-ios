public protocol PatchCommentUseCase {
    func callAsFunction(_ req: PatchCommentRequest) async throws
}
