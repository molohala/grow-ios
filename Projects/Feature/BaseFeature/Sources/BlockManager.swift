import Foundation
import BlockServiceInterface

public final class BlockManager: ObservableObject {
    private let blockUseCase: any BlockUseCase
    private let allowUseCase: any AllowUseCase
    private let getAllBlockedUserUseCase: any GetAllBlockedUserUseCase
    
    @Published public var blockSuccess = false
    @Published public var blockFailure = false
    
    @Published public var allowSuccess = false
    @Published public var allowFailure = false
    
    @Published public var blockedUser: FetchFlow<[BlockedUser]> = .fetching
    
    public init(
        blockUseCase: any BlockUseCase,
        allowUseCase: any AllowUseCase,
        getAllBlockedUserUseCase: any GetAllBlockedUserUseCase
    ) {
        self.blockUseCase = blockUseCase
        self.allowUseCase = allowUseCase
        self.getAllBlockedUserUseCase = getAllBlockedUserUseCase
    }
    
    @MainActor
    public func block(blockUserId: Int) async {
        do {
            try await blockUseCase(blockUserId: blockUserId)
            blockSuccess = true
        } catch {
            blockFailure = true
        }
    }
    
    @MainActor
    public func allow(blockUserId: Int) async {
        do {
            try await blockUseCase(blockUserId: blockUserId)
            blockSuccess = true
        } catch {
            blockFailure = true
        }
    }
    
    @MainActor
    public func fetchBlockedUsers() async {
        do {
            let users = try await getAllBlockedUserUseCase()
            blockedUser = .success(users)
        } catch {
            blockedUser = .failure
        }
    }
}
