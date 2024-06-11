public protocol ReportCommentUseCase {
    func callAsFunction(id: Int, _ req: ReportCommentRequest) async throws
}
