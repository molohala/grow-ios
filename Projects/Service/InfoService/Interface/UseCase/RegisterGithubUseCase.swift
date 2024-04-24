public protocol RegisterGithubUseCase {
    func callAsFunction(_ req: SocialIdRequest) async throws
}
