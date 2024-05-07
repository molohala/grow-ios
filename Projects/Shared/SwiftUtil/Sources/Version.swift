import Foundation

public var version: String? {
    guard let dictionary = Bundle.main.infoDictionary,
          let version = dictionary["CFBundleShortVersionString"] as? String else { return nil }
    
    return version
}
