import BaseFeature
import Foundation
import SwiftUI
import NeedleFoundation
import BaekjoonSettingFeatureInterface
import InfoServiceInterface

public protocol BaekjoonSettingDependency: Dependency {
    var infoDomainBuildable: any InfoDomainBuildable { get }
}

public final class BaekjoonSettingComponent: Component<BaekjoonSettingDependency>, BaekjoonSettingBuildable {
    public func makeView(_ baekjoonId: String) -> some View {
        BaekjoonSettingView(
            viewModel: .init(
                registerSolvedacUseCase: dependency.infoDomainBuildable.registerSolvedavUseCase,
                baekjoonId: baekjoonId
            )
        )
    }
}
