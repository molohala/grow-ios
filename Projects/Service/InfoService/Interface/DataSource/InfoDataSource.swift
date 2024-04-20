public protocol InfoDataSource {
    func getSolvedav() async throws -> Solvedav
    func getGithub() async throws -> Github
}
