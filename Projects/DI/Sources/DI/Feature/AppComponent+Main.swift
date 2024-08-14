import Foundation
import BlockFeature
import BlockFeatureInterface
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
import CommunityEditFeature
import CommunityEditFeatureInterface
import GithubRankFeature
import GithubRankFeatureInterface
import GithubSettingFeature
import GithubSettingFeatureInterface
import HomeFeature
import HomeFeatureInterface
import MainFeature
import MainFeatureInterface
import ProfileDetailFeature
import ProfileDetailFeatureInterface
import ProfileEditFeature
import ProfileEditFeatureInterface
import ProfileFeature
import ProfileFeatureInterface
import SettingFeature
import SettingFeatureInterface

public extension AppComponent {
    
    var mainBuildable: any MainBuildable {
        MainComponent(parent: self)
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
    
    var communityEditBuildable: any CommunityEditBuildable {
        CommunityEditComponent(parent: self)
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
    
    var blockBuildable: any BlockBuildable {
        BlockComponent(parent: self)
    }
}
