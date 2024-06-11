import SignInFeature
import SignInFeatureInterface

public extension AppComponent {
    
    var signInBuildable: any SignInBuildable {
        SignInComponent(parent: self)
    }
}
