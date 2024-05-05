import SwiftUI

public extension BottomTabType {
    
    var image: Image {
        switch self {
        case .Home: DesignSystemAsset.home.swiftUIImage
        case .Forum: DesignSystemAsset.chat.swiftUIImage
        case .GithubRank: DesignSystemAsset.github.swiftUIImage
        case .BaekjoonRank: DesignSystemAsset.baekjoon.swiftUIImage
        case .Profile: DesignSystemAsset.person.swiftUIImage
        }
    }
    
    var label: String {
        switch self {
        case .Home: "홈"
        case .Forum: "포럼"
        case .GithubRank: "Github"
        case .BaekjoonRank: "백준"
        case .Profile: "프로필"
        }
    }
}
