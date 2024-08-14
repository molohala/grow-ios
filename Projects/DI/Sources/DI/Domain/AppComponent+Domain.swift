import AuthService
import AuthServiceInterface
import BlockService
import BlockServiceInterface
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
import LanguageService
import LanguageServiceInterface

public extension AppComponent {
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
    
    var languageDomainBuildable: any LanguageDomainBuildable {
        shared {
            LanguageDomainComponent(parent: self)
        }
    }
    
    var blockDomainBuildable: any BlockDomainBuildable {
        shared {
            BlockDomainComponent(parent: self)
        }
    }
}
