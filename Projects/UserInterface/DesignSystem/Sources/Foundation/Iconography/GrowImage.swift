import SwiftUI

public enum GrowImage {
    case firstMedal
    case secondMedal
    case thirdMedal
    
    var image: Image {
        switch self {
        case .firstMedal: DesignSystemAsset.firstMedal.swiftUIImage
        case .secondMedal: DesignSystemAsset.secondMedal.swiftUIImage
        case .thirdMedal: DesignSystemAsset.thirdMedal.swiftUIImage
        }
    }
}
