import NeedleFoundation
import Foundation
import BlockFeatureInterface
import SwiftUI

public protocol BlockDependency: Dependency {}

public final class SettingComponent: Component<BlockDependency>, BlockBuildable {
    public func makeView() -> some View {
        BlockCoordinator()
    }
}
