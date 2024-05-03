import Foundation
import InfoServiceInterface
import BaseFeature

public final class BaekjoonSettingViewModel: ObservableObject {
    @Published var baekjoonId: String = ""
    private let registerSolvedacUseCase: any RegisterSolvedacUseCase
    
    @Published var completeFlow: FetchFlow<Bool> = .fetching
    
    public init(
        registerSolvedacUseCase: any RegisterSolvedacUseCase
    ) {
        self.registerSolvedacUseCase = registerSolvedacUseCase
    }
    
    @MainActor
    func completeSetting() async {
        completeFlow = .fetching
        do {
            try await registerSolvedacUseCase(.init(socialId: baekjoonId))
            completeFlow = .success(true)
        } catch {
            completeFlow = .failure
        }
    }
}
