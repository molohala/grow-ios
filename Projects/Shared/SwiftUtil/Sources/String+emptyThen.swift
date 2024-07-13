public extension String {
    func emptryThen(_ str: String) -> String {
        self.isEmpty ? self + str : self
    }
}
