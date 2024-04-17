import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let SwiftCrypto = TargetDependency.external(name: "Crypto")
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
    static let Pow = TargetDependency.external(name: "Pow")
//    static let AlamofireImage = TargetDependency.external(name: "AlamofireImage")
//    static let SkeletonUI = TargetDependency.external(name: "SkeletonUI")
//    static let Lottie = TargetDependency.external(name: "Lottie")
}
