import NeedleFoundation
import SignInFeature
import SignInFeatureInterface
import RootFeature
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
}
