import Foundation
import InfoServiceInterface

public final class BaekjoonSettingViewModel: ObservableObject {
    @Published var baekjoonId: String
    private let registerSolvedacUseCase: any RegisterSolvedacUseCase
    
    enum Flow {
        case idle
        case fetching
        case success
        case failure
    }
    
    @Published var flow: Flow = .idle
    
    public init(
        registerSolvedacUseCase: any RegisterSolvedacUseCase,
        baekjoonId: String
    ) {
        self.registerSolvedacUseCase = registerSolvedacUseCase
        self.baekjoonId = baekjoonId
    }
    
    @MainActor
    func completeSetting() async {
        flow = .fetching
        do {
            try await registerSolvedacUseCase(.init(socialId: baekjoonId))
            flow = .success
        } catch {
            flow = .failure
        }
    }
}
