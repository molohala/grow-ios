

import AuthService
import AuthServiceInterface
import BaekjoonRankFeature
import BaekjoonRankFeatureInterface
import BaekjoonSettingFeature
import BaekjoonSettingFeatureInterface
import BaseFeature
import CommentService
import CommentServiceInterface
import CommunityCreateFeature
import CommunityCreateFeatureInterface
import CommunityDetailFeature
import CommunityDetailFeatureInterface
import CommunityEditFeature
import CommunityEditFeatureInterface
import CommunityFeature
import CommunityFeatureInterface
import CommunityService
import CommunityServiceInterface
import Foundation
import GithubRankFeature
import GithubRankFeatureInterface
import GithubSettingFeature
import GithubSettingFeatureInterface
import HomeFeature
import HomeFeatureInterface
import InfoService
import InfoServiceInterface
import LikeService
import LikeServiceInterface
import MainFeature
import MainFeatureInterface
import NeedleFoundation
import ProfileDetailFeature
import ProfileDetailFeatureInterface
import ProfileEditFeature
import ProfileEditFeatureInterface
import ProfileFeature
import ProfileFeatureInterface
import RankService
import RankServiceInterface
import RootFeature
import SettingFeature
import SettingFeatureInterface
import SignInFeature
import SignInFeatureInterface
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class ProfileDetailDependencyac839c257b41fa6ce526Provider: ProfileDetailDependency {


    init() {

    }
}
/// ^->AppComponent->ProfileDetailComponent
private func factoryaee7dbde9cc3e483a958e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileDetailDependencyac839c257b41fa6ce526Provider()
}
private class SettingDependency792c9caceb5cb097fbecProvider: SettingDependency {
    var profileEditBuildable: any ProfileEditBuildable {
        return appComponent.profileEditBuildable
    }
    var githubSettingBuildable: any GithubSettingBuildable {
        return appComponent.githubSettingBuildable
    }
    var baekjoonSettingBuildable: any BaekjoonSettingBuildable {
        return appComponent.baekjoonSettingBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SettingComponent
private func factoryee0bbc0b920a7007e1a9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SettingDependency792c9caceb5cb097fbecProvider(appComponent: parent1(component) as! AppComponent)
}
private class ProfileDependencydc1f16da12774bc5c202Provider: ProfileDependency {
    var settingBuildable: any SettingBuildable {
        return appComponent.settingBuildable
    }
    var infoDomainBuildable: any InfoDomainBuildable {
        return appComponent.infoDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ProfileComponent
private func factory823eb350c729b9705904f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileDependencydc1f16da12774bc5c202Provider(appComponent: parent1(component) as! AppComponent)
}
private class MainDependency7c6a5b4738b211b8e155Provider: MainDependency {
    var homeBuildable: any HomeBuildable {
        return appComponent.homeBuildable
    }
    var communityBuildable: any CommunityBuildable {
        return appComponent.communityBuildable
    }
    var githubRankBuildable: any GithubRankBuildable {
        return appComponent.githubRankBuildable
    }
    var baekjoonRankBuildable: any BaekjoonRankBuildable {
        return appComponent.baekjoonRankBuildable
    }
    var profileBuildable: any ProfileBuildable {
        return appComponent.profileBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainComponent
private func factoryc9274e46e78e70f29c54f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainDependency7c6a5b4738b211b8e155Provider(appComponent: parent1(component) as! AppComponent)
}
private class GithubRankDependency2a656f8c1300149b0745Provider: GithubRankDependency {
    var profileDetailBuildable: any ProfileDetailBuildable {
        return appComponent.profileDetailBuildable
    }
    var githubSettingBuildable: any GithubSettingBuildable {
        return appComponent.githubSettingBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->GithubRankComponent
private func factoryb50de2dec37458c48a12f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return GithubRankDependency2a656f8c1300149b0745Provider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var mainBuildable: any MainBuildable {
        return appComponent.mainBuildable
    }
    var signInBuildable: any SignInBuildable {
        return appComponent.signInBuildable
    }
    var authDomainBuildable: any AuthDomainBuildable {
        return appComponent.authDomainBuildable
    }
    var infoDomainBuildable: any InfoDomainBuildable {
        return appComponent.infoDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class CommunityCreateDependency4cbbd0754f80ca35ed27Provider: CommunityCreateDependency {
    var communityDomainBuildable: any CommunityDomainBuildable {
        return appComponent.communityDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->CommunityCreateComponent
private func factoryff448a1abf8354e355e3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CommunityCreateDependency4cbbd0754f80ca35ed27Provider(appComponent: parent1(component) as! AppComponent)
}
private class CommunityDetailDependencyddffd27390310f096b6cProvider: CommunityDetailDependency {
    var communityDomainBuildable: any CommunityDomainBuildable {
        return appComponent.communityDomainBuildable
    }
    var commentDomainBuildable: any CommentDomainBuildable {
        return appComponent.commentDomainBuildable
    }
    var likeDomainBuildable: any LikeDomainBuildable {
        return appComponent.likeDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->CommunityDetailComponent
private func factory3462e9b95264febd1513f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CommunityDetailDependencyddffd27390310f096b6cProvider(appComponent: parent1(component) as! AppComponent)
}
private class SignInDependency5dda0dd015447272446cProvider: SignInDependency {
    var authDomainBuildable: any AuthDomainBuildable {
        return appComponent.authDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignInComponent
private func factoryda2925fd76da866a652af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignInDependency5dda0dd015447272446cProvider(appComponent: parent1(component) as! AppComponent)
}
private class CommunityDependency704c8bb629388d37b98dProvider: CommunityDependency {
    var communityCreateBuildable: any CommunityCreateBuildable {
        return appComponent.communityCreateBuildable
    }
    var communityDetailBuildable: any CommunityDetailBuildable {
        return appComponent.communityDetailBuildable
    }
    var communityDomainBuildable: any CommunityDomainBuildable {
        return appComponent.communityDomainBuildable
    }
    var likeDomainBuildable: any LikeDomainBuildable {
        return appComponent.likeDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->CommunityComponent
private func factorya680b0f614045d42b1adf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CommunityDependency704c8bb629388d37b98dProvider(appComponent: parent1(component) as! AppComponent)
}
private class HomeDependency443c4e1871277bd8432aProvider: HomeDependency {
    var profileDetailBuildable: any ProfileDetailBuildable {
        return appComponent.profileDetailBuildable
    }
    var communityDetailBuildable: any CommunityDetailBuildable {
        return appComponent.communityDetailBuildable
    }
    var profileBuildable: any ProfileBuildable {
        return appComponent.profileBuildable
    }
    var communityBuildable: any CommunityBuildable {
        return appComponent.communityBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->HomeComponent
private func factory67229cdf0f755562b2b1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency443c4e1871277bd8432aProvider(appComponent: parent1(component) as! AppComponent)
}
private class GithubSettingDependency47eb9ae61eeb8f68ab76Provider: GithubSettingDependency {
    var infoDomainBuildable: any InfoDomainBuildable {
        return appComponent.infoDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->GithubSettingComponent
private func factorybe58855116216af426a2f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return GithubSettingDependency47eb9ae61eeb8f68ab76Provider(appComponent: parent1(component) as! AppComponent)
}
private class ProfileEditDependencyec9ccff05278bca24819Provider: ProfileEditDependency {


    init() {

    }
}
/// ^->AppComponent->ProfileEditComponent
private func factoryff80df4e3e21c6a49df9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileEditDependencyec9ccff05278bca24819Provider()
}
private class CommunityEditDependency1ee294b35aa9a8c53e29Provider: CommunityEditDependency {
    var communityDomainBuildable: any CommunityDomainBuildable {
        return appComponent.communityDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->CommunityEditComponent
private func factory6ebc832ed4bcf9ae0afff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CommunityEditDependency1ee294b35aa9a8c53e29Provider(appComponent: parent1(component) as! AppComponent)
}
private class BaekjoonRankDependency7e94a57b9cd7dc6dd837Provider: BaekjoonRankDependency {


    init() {

    }
}
/// ^->AppComponent->BaekjoonRankComponent
private func factoryf8ddad049da0deefda19e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return BaekjoonRankDependency7e94a57b9cd7dc6dd837Provider()
}
private class BaekjoonSettingDependencyce5bee460baf327a3c82Provider: BaekjoonSettingDependency {
    var infoDomainBuildable: any InfoDomainBuildable {
        return appComponent.infoDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->BaekjoonSettingComponent
private func factorycbb61afc845cf58732dbf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return BaekjoonSettingDependencyce5bee460baf327a3c82Provider(appComponent: parent1(component) as! AppComponent)
}
private class LikeDomainDependencyf63c0c1617be7448fbeeProvider: LikeDomainDependency {


    init() {

    }
}
/// ^->AppComponent->LikeDomainComponent
private func factory9270861c93e2286ee142e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LikeDomainDependencyf63c0c1617be7448fbeeProvider()
}
private class InfoDomainDependency1d4a019e46f9ed94bc8eProvider: InfoDomainDependency {


    init() {

    }
}
/// ^->AppComponent->InfoDomainComponent
private func factoryce0a1bbfc08c2337f426e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InfoDomainDependency1d4a019e46f9ed94bc8eProvider()
}
private class CommentDomainDependencyc311ef3dc1043384eea3Provider: CommentDomainDependency {


    init() {

    }
}
/// ^->AppComponent->CommentDomainComponent
private func factory9d07e84c0c1fdd02736fe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CommentDomainDependencyc311ef3dc1043384eea3Provider()
}
private class RankDomainDependency8f9f9683f682e9e4ee98Provider: RankDomainDependency {


    init() {

    }
}
/// ^->AppComponent->RankDomainComponent
private func factoryb45149ba1cc02c58ddc7e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RankDomainDependency8f9f9683f682e9e4ee98Provider()
}
private class AuthDomainDependency4518b8977185a5c9ff71Provider: AuthDomainDependency {


    init() {

    }
}
/// ^->AppComponent->AuthDomainComponent
private func factoryc9b20c320bb79402d4c1e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthDomainDependency4518b8977185a5c9ff71Provider()
}
private class CommunityDomainDependency65d739140d7d8d39012bProvider: CommunityDomainDependency {


    init() {

    }
}
/// ^->AppComponent->CommunityDomainComponent
private func factoryb1f366c0bb811d91cf77e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CommunityDomainDependency65d739140d7d8d39012bProvider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["rootView-RootComponent"] = { [unowned self] in self.rootView as Any }
        localTable["signInBuildable-any SignInBuildable"] = { [unowned self] in self.signInBuildable as Any }
        localTable["mainBuildable-any MainBuildable"] = { [unowned self] in self.mainBuildable as Any }
        localTable["baekjoonRankBuildable-any BaekjoonRankBuildable"] = { [unowned self] in self.baekjoonRankBuildable as Any }
        localTable["baekjoonSettingBuildable-any BaekjoonSettingBuildable"] = { [unowned self] in self.baekjoonSettingBuildable as Any }
        localTable["communityCreateBuildable-any CommunityCreateBuildable"] = { [unowned self] in self.communityCreateBuildable as Any }
        localTable["communityEditBuildable-any CommunityEditBuildable"] = { [unowned self] in self.communityEditBuildable as Any }
        localTable["communityDetailBuildable-any CommunityDetailBuildable"] = { [unowned self] in self.communityDetailBuildable as Any }
        localTable["communityBuildable-any CommunityBuildable"] = { [unowned self] in self.communityBuildable as Any }
        localTable["githubRankBuildable-any GithubRankBuildable"] = { [unowned self] in self.githubRankBuildable as Any }
        localTable["githubSettingBuildable-any GithubSettingBuildable"] = { [unowned self] in self.githubSettingBuildable as Any }
        localTable["homeBuildable-any HomeBuildable"] = { [unowned self] in self.homeBuildable as Any }
        localTable["profileDetailBuildable-any ProfileDetailBuildable"] = { [unowned self] in self.profileDetailBuildable as Any }
        localTable["profileEditBuildable-any ProfileEditBuildable"] = { [unowned self] in self.profileEditBuildable as Any }
        localTable["profileBuildable-any ProfileBuildable"] = { [unowned self] in self.profileBuildable as Any }
        localTable["settingBuildable-any SettingBuildable"] = { [unowned self] in self.settingBuildable as Any }
    }
}
extension ProfileDetailComponent: Registration {
    public func registerItems() {

    }
}
extension SettingComponent: Registration {
    public func registerItems() {
        keyPathToName[\SettingDependency.profileEditBuildable] = "profileEditBuildable-any ProfileEditBuildable"
        keyPathToName[\SettingDependency.githubSettingBuildable] = "githubSettingBuildable-any GithubSettingBuildable"
        keyPathToName[\SettingDependency.baekjoonSettingBuildable] = "baekjoonSettingBuildable-any BaekjoonSettingBuildable"
    }
}
extension ProfileComponent: Registration {
    public func registerItems() {
        keyPathToName[\ProfileDependency.settingBuildable] = "settingBuildable-any SettingBuildable"
        keyPathToName[\ProfileDependency.infoDomainBuildable] = "infoDomainBuildable-any InfoDomainBuildable"
    }
}
extension MainComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainDependency.homeBuildable] = "homeBuildable-any HomeBuildable"
        keyPathToName[\MainDependency.communityBuildable] = "communityBuildable-any CommunityBuildable"
        keyPathToName[\MainDependency.githubRankBuildable] = "githubRankBuildable-any GithubRankBuildable"
        keyPathToName[\MainDependency.baekjoonRankBuildable] = "baekjoonRankBuildable-any BaekjoonRankBuildable"
        keyPathToName[\MainDependency.profileBuildable] = "profileBuildable-any ProfileBuildable"
    }
}
extension GithubRankComponent: Registration {
    public func registerItems() {
        keyPathToName[\GithubRankDependency.profileDetailBuildable] = "profileDetailBuildable-any ProfileDetailBuildable"
        keyPathToName[\GithubRankDependency.githubSettingBuildable] = "githubSettingBuildable-any GithubSettingBuildable"
    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.mainBuildable] = "mainBuildable-any MainBuildable"
        keyPathToName[\RootDependency.signInBuildable] = "signInBuildable-any SignInBuildable"
        keyPathToName[\RootDependency.authDomainBuildable] = "authDomainBuildable-any AuthDomainBuildable"
        keyPathToName[\RootDependency.infoDomainBuildable] = "infoDomainBuildable-any InfoDomainBuildable"
    }
}
extension CommunityCreateComponent: Registration {
    public func registerItems() {
        keyPathToName[\CommunityCreateDependency.communityDomainBuildable] = "communityDomainBuildable-any CommunityDomainBuildable"
    }
}
extension CommunityDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\CommunityDetailDependency.communityDomainBuildable] = "communityDomainBuildable-any CommunityDomainBuildable"
        keyPathToName[\CommunityDetailDependency.commentDomainBuildable] = "commentDomainBuildable-any CommentDomainBuildable"
        keyPathToName[\CommunityDetailDependency.likeDomainBuildable] = "likeDomainBuildable-any LikeDomainBuildable"
    }
}
extension SignInComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignInDependency.authDomainBuildable] = "authDomainBuildable-any AuthDomainBuildable"
    }
}
extension CommunityComponent: Registration {
    public func registerItems() {
        keyPathToName[\CommunityDependency.communityCreateBuildable] = "communityCreateBuildable-any CommunityCreateBuildable"
        keyPathToName[\CommunityDependency.communityDetailBuildable] = "communityDetailBuildable-any CommunityDetailBuildable"
        keyPathToName[\CommunityDependency.communityDomainBuildable] = "communityDomainBuildable-any CommunityDomainBuildable"
        keyPathToName[\CommunityDependency.likeDomainBuildable] = "likeDomainBuildable-any LikeDomainBuildable"
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.profileDetailBuildable] = "profileDetailBuildable-any ProfileDetailBuildable"
        keyPathToName[\HomeDependency.communityDetailBuildable] = "communityDetailBuildable-any CommunityDetailBuildable"
        keyPathToName[\HomeDependency.profileBuildable] = "profileBuildable-any ProfileBuildable"
        keyPathToName[\HomeDependency.communityBuildable] = "communityBuildable-any CommunityBuildable"
    }
}
extension GithubSettingComponent: Registration {
    public func registerItems() {
        keyPathToName[\GithubSettingDependency.infoDomainBuildable] = "infoDomainBuildable-any InfoDomainBuildable"
    }
}
extension ProfileEditComponent: Registration {
    public func registerItems() {

    }
}
extension CommunityEditComponent: Registration {
    public func registerItems() {
        keyPathToName[\CommunityEditDependency.communityDomainBuildable] = "communityDomainBuildable-any CommunityDomainBuildable"
    }
}
extension BaekjoonRankComponent: Registration {
    public func registerItems() {

    }
}
extension BaekjoonSettingComponent: Registration {
    public func registerItems() {
        keyPathToName[\BaekjoonSettingDependency.infoDomainBuildable] = "infoDomainBuildable-any InfoDomainBuildable"
    }
}
extension LikeDomainComponent: Registration {
    public func registerItems() {

    }
}
extension InfoDomainComponent: Registration {
    public func registerItems() {

    }
}
extension CommentDomainComponent: Registration {
    public func registerItems() {

    }
}
extension RankDomainComponent: Registration {
    public func registerItems() {

    }
}
extension AuthDomainComponent: Registration {
    public func registerItems() {

    }
}
extension CommunityDomainComponent: Registration {
    public func registerItems() {

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->ProfileDetailComponent", factoryaee7dbde9cc3e483a958e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->SettingComponent", factoryee0bbc0b920a7007e1a9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ProfileComponent", factory823eb350c729b9705904f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainComponent", factoryc9274e46e78e70f29c54f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->GithubRankComponent", factoryb50de2dec37458c48a12f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->CommunityCreateComponent", factoryff448a1abf8354e355e3f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->CommunityDetailComponent", factory3462e9b95264febd1513f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignInComponent", factoryda2925fd76da866a652af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->CommunityComponent", factorya680b0f614045d42b1adf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->GithubSettingComponent", factorybe58855116216af426a2f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ProfileEditComponent", factoryff80df4e3e21c6a49df9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->CommunityEditComponent", factory6ebc832ed4bcf9ae0afff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->BaekjoonRankComponent", factoryf8ddad049da0deefda19e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->BaekjoonSettingComponent", factorycbb61afc845cf58732dbf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LikeDomainComponent", factory9270861c93e2286ee142e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->InfoDomainComponent", factoryce0a1bbfc08c2337f426e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->CommentDomainComponent", factory9d07e84c0c1fdd02736fe3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RankDomainComponent", factoryb45149ba1cc02c58ddc7e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->AuthDomainComponent", factoryc9b20c320bb79402d4c1e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->CommunityDomainComponent", factoryb1f366c0bb811d91cf77e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
