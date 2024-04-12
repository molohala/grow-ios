public struct PageRequest: Encodable {
    let page: Int
    let size: Int
    
    public init(page: Int, size: Int) {
        self.page = page
        self.size = size
    }
}
