import InfoServiceInterface

class InfoRepositoryImpl: InfoRepository {
    
    private let infoDataSource: any InfoDataSource
    
    init(infoDataSource: any InfoDataSource) {
        self.infoDataSource = infoDataSource
    }
    
    func getSolvedav(name: String) async throws -> Solvedav {
        try await infoDataSource.getSolvedav(name: name)
    }
    
    func getGithub(name: String) async throws -> Github {
        try await infoDataSource.getGithub(name: name)
    }
}
