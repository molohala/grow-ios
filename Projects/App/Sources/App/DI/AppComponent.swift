import NeedleFoundation
import RootFeature
import SwiftUI

public final class AppComponent: BootstrapComponent {
    
    public func makeRootView() -> some View {
        rootView.makeView()
    }
    
    public var rootView: RootComponent {
        RootComponent(parent: self)
    }
}
