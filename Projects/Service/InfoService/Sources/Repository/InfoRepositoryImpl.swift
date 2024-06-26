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
    func registerSolvedac(_ req: SocialIdRequest) async throws {
        try await infoDataSource.registerSolvedac(req)
    }
    
    func registerGithub(_ req: SocialIdRequest) async throws {
        try await infoDataSource.registerGithub(req)
    }
    
    func getProfile() async throws -> Profile {
        try await infoDataSource.getProfile()
    }
    
    func getProfile(memberId: Int) async throws -> Profile {
        try await infoDataSource.getProfile(memberId: memberId)
    }
    
    func patchMyProfile(_ req: PatchMyProfileRequest) async throws {
        try await infoDataSource.patchMyProfile(req)
    }
    
    func getJobs() async throws -> [String] {
        try await infoDataSource.getJobs()
    }
}
