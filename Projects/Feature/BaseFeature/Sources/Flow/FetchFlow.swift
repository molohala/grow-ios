public enum FetchFlow<Data: Equatable>: Equatable {
    case fetching
    case success(Data)
    case failure
    
    public var data: Data? {
        if case .success(let data) = self {
            data
        } else {
            nil
        }
    }
}
