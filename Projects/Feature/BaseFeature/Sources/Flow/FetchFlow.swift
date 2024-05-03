public enum FetchFlow<Data: Equatable>: Equatable {
    case fetching
    case success(Data)
    case failure
}
