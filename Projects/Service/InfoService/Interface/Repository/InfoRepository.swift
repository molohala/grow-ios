public protocol InfoRepository {
    func getSolvedav() async throws -> Solvedav
    func getGithub() async throws -> Github
}
