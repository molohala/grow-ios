public protocol RegisterSolvedacUseCase {
    func callAsFunction(_ req: SocialIdRequest) async throws
}
