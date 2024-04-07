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

final class AppComponent: BootstrapComponent {
    
    public func makeRootView() -> some View {
        rootView.makeView()
    }
    
    public var rootView: RootComponent {
        RootComponent(parent: self)
    }
    
    public var singInBuildable: any SignInBuildable {
        SignInComponent(parent: self)
    }
    
    public var baekjoonRankBuildable: any BaekjoonRankBuildable {
        BaekjoonRankComponent(parent: self)
    }
    
    public var baekjoonSettingBuildable: any BaekjoonSettingBuildable {
        BaekjoonSettingComponent(parent: self)
    }
    
    public var communityCreateBuildable: any CommunityCreateBuildable {
        CommunityCreateComponent(parent: self)
    }
    
    public var communityDetailBuildable: any CommunityDetailBuildable {
        CommunityDetailComponent(parent: self)
    }
    
    public var communityBuildable: any CommunityBuildable {
        CommunityComponent(parent: self)
    }
    
    public var githubRankBuildable: any GithubRankBuildable {
        GithubRankComponent(parent: self)
    }
    
    public var githubSettingBuildable: any GithubSettingBuildable {
        GithubSettingComponent(parent: self)
    }
    
    public var homeBuildable: any HomeBuildable {
        HomeComponent(parent: self)
    }
    
    public var mainBuildable: any MainBuildable {
        MainComponent(parent: self)
    }
    
    public var profileDetailBuildable: any ProfileDetailBuildable {
        ProfileDetailComponent(parent: self)
    }
    
    public var profileEditBuildable: any ProfileEditBuildable {
        ProfileEditComponent(parent: self)
    }
    
    public var profileBuildable: any ProfileBuildable {
        ProfileComponent(parent: self)
    }
    
    public var settingBuildable: any SettingBuildable {
        SettingComponent(parent: self)
    }
}
