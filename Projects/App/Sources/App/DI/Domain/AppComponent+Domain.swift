//
//  AppComponent+Auth.swift
//  App
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import AuthService
import AuthServiceInterface
import CommunityService
import CommunityServiceInterface
import LikeService
import LikeServiceInterface
import CommentService
import CommentServiceInterface

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
}
