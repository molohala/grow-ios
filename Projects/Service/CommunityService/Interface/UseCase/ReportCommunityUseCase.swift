public protocol ReportCommunityUseCase {
    func callAsFunction(id: Int, _ req: ReportCommunityRequest) async throws
}
