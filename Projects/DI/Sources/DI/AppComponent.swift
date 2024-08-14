import NeedleFoundation
import RootFeature
import SwiftUI
import DI

public final class AppComponent: BootstrapComponent {
    
    public func makeRootView() -> some View {
        rootView.makeView()
    }
    
    public var rootView: RootComponent {
        shared {
            RootComponent(parent: self)
        }
    }
}
