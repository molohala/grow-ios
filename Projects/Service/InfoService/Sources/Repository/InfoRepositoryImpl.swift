import InfoServiceInterface

class InfoRepositoryImpl: InfoRepository {
    
    private let infoDataSource: any InfoDataSource
    
    init(infoDataSource: any InfoDataSource) {
        self.infoDataSource = infoDataSource
    }
    
    func getSolvedav() async throws -> Solvedav {
        try await infoDataSource.getSolvedav()
    }
    
    func getGithub() async throws -> Github {
        try await infoDataSource.getGithub()
    }
}
