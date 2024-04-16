public protocol CreateCommentUseCase {
    func callAsFunction(_ req: CreateCommentRequest) async throws
}
