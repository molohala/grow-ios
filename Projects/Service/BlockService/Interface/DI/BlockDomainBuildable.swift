public protocol BlockDomainBuildable {
    var blockUseCase: BlockUseCase { get }
    var allowUseCase: AllowUseCase { get }
    var getAllBlockedUserUseCase: GetAllBlockedUserUseCase { get }
}
