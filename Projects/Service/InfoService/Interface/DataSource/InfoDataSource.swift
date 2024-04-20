public protocol InfoDataSource {
    func getSolvedav(name: String) async throws -> Solvedav
    func getGithub(name: String) async throws -> Github
}
