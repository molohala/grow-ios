public protocol InfoDataSource {
    func getSolvedav(name: String) async throws -> Solvedav
    func getGithub(name: String) async throws -> Github
    func registerSolvedac(_ req: SocialIdRequest) async throws
    func registerGithub(_ req: SocialIdRequest) async throws
    func getProfile() async throws -> Profile
}
