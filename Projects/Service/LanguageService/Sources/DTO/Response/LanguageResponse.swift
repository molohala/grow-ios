import LanguageServiceInterface

struct LanguageResponse: Decodable {
    let id: Int
    let name: String
}

extension LanguageResponse {
    func toDomain() -> Language {
        Language(
            id: id,
            name: name
        )
    }
}
