import Foundation

public extension String {
    var links: [String] {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))

        return matches
            .compactMap { match in
                guard let range = Range(match.range, in: self) else {
                    return nil
                }
                let url = self[range]
                return String(url)
            }
    }
}
