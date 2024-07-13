import Foundation

public extension URL {
    var domain: String? {
        guard let scheme, let host else {
            return nil
        }
        return "\(scheme)://\(host)"
    }
}
