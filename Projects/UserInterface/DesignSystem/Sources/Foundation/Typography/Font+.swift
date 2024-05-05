//
//  Font+.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public enum GrowFont {
    case title1B
    case title1M
    case title1R
    
    case title2B
    case title2M
    case title2R
    
    case headline1B
    case headline1M
    case headline1R
    
    case headline2B
    case headline2M
    case headline2R
    
    case bodyB
    case bodyM
    case bodyR
    
    case labelB
    case labelM
    case labelR
    
    case captionB
    case captionM
    case captionR
    
    typealias Wanted = DesignSystemFontFamily.WantedSans
    
    public var font: Font {
        switch self {
        case .title1B: Wanted.bold.swiftUIFont(size: 28)
        case .title1M: Wanted.medium.swiftUIFont(size: 28)
        case .title1R: Wanted.regular.swiftUIFont(size: 28)
        case .title2B: Wanted.bold.swiftUIFont(size: 24)
        case .title2M: Wanted.medium.swiftUIFont(size: 24)
        case .title2R: Wanted.regular.swiftUIFont(size: 24)
        case .headline1B: Wanted.bold.swiftUIFont(size: 20)
        case .headline1M: Wanted.medium.swiftUIFont(size: 20)
        case .headline1R: Wanted.regular.swiftUIFont(size: 20)
        case .headline2B: Wanted.bold.swiftUIFont(size: 18)
        case .headline2M: Wanted.medium.swiftUIFont(size: 18)
        case .headline2R: Wanted.regular.swiftUIFont(size: 18)
        case .bodyB: Wanted.bold.swiftUIFont(size: 16)
        case .bodyM: Wanted.medium.swiftUIFont(size: 16)
        case .bodyR: Wanted.regular.swiftUIFont(size: 16)
        case .labelB: Wanted.bold.swiftUIFont(size: 14)
        case .labelM: Wanted.medium.swiftUIFont(size: 14)
        case .labelR: Wanted.regular.swiftUIFont(size: 14)
        case .captionB: Wanted.bold.swiftUIFont(size: 12)
        case .captionM: Wanted.medium.swiftUIFont(size: 12)
        case .captionR: Wanted.regular.swiftUIFont(size: 12)
        }
    }
}

public extension View {
    func growFont(_ growFont: GrowFont) -> some View {
        self.font(growFont.font)
    }
}
