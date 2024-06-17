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
}
