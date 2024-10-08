import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let SwiftCrypto = TargetDependency.external(name: "Crypto")
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
    static let Pow = TargetDependency.external(name: "Pow")
//    static let Nuke = TargetDependency.external(name: "Nuke")
//    static let NukeUI = TargetDependency.external(name: "NukeUI")
    static let Flow = TargetDependency.external(name: "Flow")
    static let MyDesignSystem = TargetDependency.external(name: "MyDesignSystem")
    static let OpenGraph = TargetDependency.external(name: "OpenGraph")
    static let FirebaseAnalytics = TargetDependency.external(name: "FirebaseAnalytics")
    static let FirebaseCrashlytics = TargetDependency.external(name: "FirebaseCrashlytics")
    static let FirebaseMessaging = TargetDependency.external(name: "FirebaseMessaging")
}
