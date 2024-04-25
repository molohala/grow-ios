import AuthService
import AuthServiceInterface
import CommunityService
import CommunityServiceInterface
import LikeService
import LikeServiceInterface
import CommentService
import CommentServiceInterface
import InfoService
import InfoServiceInterface
import RankService
import RankServiceInterface

extension AppComponent {
    var authDomainBuildable: any AuthDomainBuildable {
        shared {
            AuthDomainComponent(parent: self)
        }
    }
    
    var communityDomainBuildable: any CommunityDomainBuildable {
        shared {
            CommunityDomainComponent(parent: self)
        }
    }
    
    var likeDomainBuildable: any LikeDomainBuildable {
        shared {
            LikeDomainComponent(parent: self)
        }
    }
    
    var commentDomainBuildable: any CommentDomainBuildable {
        shared {
            CommentDomainComponent(parent: self)
        }
    }
    
    var infoDomainBuildable: any InfoDomainBuildable {
        shared {
            InfoDomainComponent(parent: self)
        }
    }
    
    var rankDomainBuildable: any RankDomainBuildable {
        shared {
            RankDomainComponent(parent: self)
        }
    }
}
