public struct PatchMyLanguagesRequest: Encodable {
    let langs: [Int]
    
    public init(langs: [Int]) {
        self.langs = langs
    }
}
