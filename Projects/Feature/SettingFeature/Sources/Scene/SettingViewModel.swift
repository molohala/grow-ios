import Foundation
import AuthServiceInterface

public final class SettingViewModel: ObservableObject {
    
    // MARK: - UseCases
    private let removeUseCase: any RemoveUseCase
    
    public init(
        removeUseCase: any RemoveUseCase
    ) {
        self.removeUseCase = removeUseCase
    }
    
    // MARK: - States
    @Published var githubId = ""
    @Published var baekjoonId = ""
    @Published var showRemoveMemberFailureDialog = false
    
    @MainActor
    func removeMember(
        completion: @escaping () -> Void
    ) async {
        do {
            try await removeUseCase()
            completion()
        } catch {
            showRemoveMemberFailureDialog = true
        }
    }
}
