import NeedleFoundation
import SignInFeature
import SignInFeatureInterface
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
import GithubRankFeature
import GithubRankFeatureInterface
import GithubSettingFeature
import GithubSettingFeatureInterface
import HomeFeature
import HomeFeatureInterface
import MainFeature
import MainFeatureInterface
import RootFeature
import RootFeatureInterface
import ProfileDetailFeature
import ProfileDetailFeatureInterface
import ProfileEditFeature
import ProfileEditFeatureInterface
import ProfileFeature
import ProfileFeatureInterface
import SettingFeature
import SettingFeatureInterface
import SwiftUI

public final class AppComponent: BootstrapComponent {
    
    public func makeRootView() -> some View {
        rootView.makeView()
    }
    
    public var rootView: RootComponent {
        RootComponent(parent: self)
    }
}

public extension AppComponent {
    var singInBuildable: any SignInBuildable {
        SignInComponent(parent: self)
    }
    
    var baekjoonRankBuildable: any BaekjoonRankBuildable {
        BaekjoonRankComponent(parent: self)
    }
    
    var baekjoonSettingBuildable: any BaekjoonSettingBuildable {
        BaekjoonSettingComponent(parent: self)
    }
    
    var communityCreateBuildable: any CommunityCreateBuildable {
        CommunityCreateComponent(parent: self)
    }
    
    var communityDetailBuildable: any CommunityDetailBuildable {
        CommunityDetailComponent(parent: self)
    }
    
    var communityBuildable: any CommunityBuildable {
        CommunityComponent(parent: self)
    }
    
    var githubRankBuildable: any GithubRankBuildable {
        GithubRankComponent(parent: self)
    }
    
    var githubSettingBuildable: any GithubSettingBuildable {
        GithubSettingComponent(parent: self)
    }
    
    var homeBuildable: any HomeBuildable {
        HomeComponent(parent: self)
    }
    
    var mainBuildable: any MainBuildable {
        MainComponent(parent: self)
    }
    
    var profileDetailBuildable: any ProfileDetailBuildable {
        ProfileDetailComponent(parent: self)
    }
    
    var profileEditBuildable: any ProfileEditBuildable {
        ProfileEditComponent(parent: self)
    }
    
    var profileBuildable: any ProfileBuildable {
        ProfileComponent(parent: self)
    }
    
    var settingBuildable: any SettingBuildable {
        SettingComponent(parent: self)
    }
}
