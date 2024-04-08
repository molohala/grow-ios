

import BaekjoonRankFeature
import BaekjoonRankFeatureInterface
import BaekjoonSettingFeature
import BaekjoonSettingFeatureInterface
import CommunityCreateFeature
import CommunityCreateFeatureInterface
import CommunityDetailFeature
import CommunityDetailFeatureInterface
import CommunityFeature
import CommunityFeatureInterface
import Foundation
import GithubRankFeature
import GithubRankFeatureInterface
import GithubSettingFeature
import GithubSettingFeatureInterface
import HomeFeature
import HomeFeatureInterface
import MainFeature
import MainFeatureInterface
import NeedleFoundation
import ProfileDetailFeature
import ProfileDetailFeatureInterface
import ProfileEditFeature
import ProfileEditFeatureInterface
import ProfileFeature
import ProfileFeatureInterface
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


    init() {

    }
}
/// ^->AppComponent->SettingComponent
private func factoryee0bbc0b920a7007e1a9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SettingDependency792c9caceb5cb097fbecProvider()
}
private class ProfileDependencydc1f16da12774bc5c202Provider: ProfileDependency {
    var settingBuildable: any SettingBuildable {
        return appComponent.settingBuildable
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


    init() {

    }
}
/// ^->AppComponent->CommunityCreateComponent
private func factoryff448a1abf8354e355e3e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CommunityCreateDependency4cbbd0754f80ca35ed27Provider()
}
private class CommunityDetailDependencyddffd27390310f096b6cProvider: CommunityDetailDependency {


    init() {

    }
}
/// ^->AppComponent->CommunityDetailComponent
private func factory3462e9b95264febd1513e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CommunityDetailDependencyddffd27390310f096b6cProvider()
}
private class SignInDependency5dda0dd015447272446cProvider: SignInDependency {


    init() {

    }
}
/// ^->AppComponent->SignInComponent
private func factoryda2925fd76da866a652ae3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignInDependency5dda0dd015447272446cProvider()
}
private class CommunityDependency704c8bb629388d37b98dProvider: CommunityDependency {
    var communityCreateBuildable: any CommunityCreateBuildable {
        return appComponent.communityCreateBuildable
    }
    var communityDetailBuildable: any CommunityDetailBuildable {
        return appComponent.communityDetailBuildable
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


    init() {

    }
}
/// ^->AppComponent->GithubSettingComponent
private func factorybe58855116216af426a2e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return GithubSettingDependency47eb9ae61eeb8f68ab76Provider()
}
private class ProfileEditDependencyec9ccff05278bca24819Provider: ProfileEditDependency {


    init() {

    }
}
/// ^->AppComponent->ProfileEditComponent
private func factoryff80df4e3e21c6a49df9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ProfileEditDependencyec9ccff05278bca24819Provider()
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


    init() {

    }
}
/// ^->AppComponent->BaekjoonSettingComponent
private func factorycbb61afc845cf58732dbe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return BaekjoonSettingDependencyce5bee460baf327a3c82Provider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["rootView-RootComponent"] = { [unowned self] in self.rootView as Any }
        localTable["mainBuildable-any MainBuildable"] = { [unowned self] in self.mainBuildable as Any }
        localTable["signInBuildable-any SignInBuildable"] = { [unowned self] in self.signInBuildable as Any }
        localTable["baekjoonRankBuildable-any BaekjoonRankBuildable"] = { [unowned self] in self.baekjoonRankBuildable as Any }
        localTable["baekjoonSettingBuildable-any BaekjoonSettingBuildable"] = { [unowned self] in self.baekjoonSettingBuildable as Any }
        localTable["communityCreateBuildable-any CommunityCreateBuildable"] = { [unowned self] in self.communityCreateBuildable as Any }
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

    }
}
extension ProfileComponent: Registration {
    public func registerItems() {
        keyPathToName[\ProfileDependency.settingBuildable] = "settingBuildable-any SettingBuildable"
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
    }
}
extension CommunityCreateComponent: Registration {
    public func registerItems() {

    }
}
extension CommunityDetailComponent: Registration {
    public func registerItems() {

    }
}
extension SignInComponent: Registration {
    public func registerItems() {

    }
}
extension CommunityComponent: Registration {
    public func registerItems() {
        keyPathToName[\CommunityDependency.communityCreateBuildable] = "communityCreateBuildable-any CommunityCreateBuildable"
        keyPathToName[\CommunityDependency.communityDetailBuildable] = "communityDetailBuildable-any CommunityDetailBuildable"
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.profileDetailBuildable] = "profileDetailBuildable-any ProfileDetailBuildable"
        keyPathToName[\HomeDependency.communityDetailBuildable] = "communityDetailBuildable-any CommunityDetailBuildable"
    }
}
extension GithubSettingComponent: Registration {
    public func registerItems() {

    }
}
extension ProfileEditComponent: Registration {
    public func registerItems() {

    }
}
extension BaekjoonRankComponent: Registration {
    public func registerItems() {

    }
}
extension BaekjoonSettingComponent: Registration {
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
    registerProviderFactory("^->AppComponent->SettingComponent", factoryee0bbc0b920a7007e1a9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->ProfileComponent", factory823eb350c729b9705904f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainComponent", factoryc9274e46e78e70f29c54f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->GithubRankComponent", factoryb50de2dec37458c48a12f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->CommunityCreateComponent", factoryff448a1abf8354e355e3e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->CommunityDetailComponent", factory3462e9b95264febd1513e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->SignInComponent", factoryda2925fd76da866a652ae3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->CommunityComponent", factorya680b0f614045d42b1adf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->GithubSettingComponent", factorybe58855116216af426a2e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->ProfileEditComponent", factoryff80df4e3e21c6a49df9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->BaekjoonRankComponent", factoryf8ddad049da0deefda19e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->BaekjoonSettingComponent", factorycbb61afc845cf58732dbe3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
