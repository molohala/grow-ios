import SignInFeature
import SignInFeatureInterface
import SwiftUI

public extension AppComponent {
    
    var signInBuildable: any SignInBuildable {
        SignInComponent(parent: self)
    }
}
