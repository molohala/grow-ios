//
//  Font+.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public enum GrowFont {
    case largeTitle
    case title
    case headline
    case subheadline
    case body
    case callout
    case footnote
    case caption
    
    public var font: Font {
        switch self {
        case .largeTitle:
            DesignSystemFontFamily.WantedSans.bold.swiftUIFont(size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
        case .title:
            DesignSystemFontFamily.WantedSans.semiBold.swiftUIFont(size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
        case .headline:
            DesignSystemFontFamily.WantedSans.semiBold.swiftUIFont(size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
        case .subheadline:
            DesignSystemFontFamily.WantedSans.semiBold.swiftUIFont(size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
        case .body:
            DesignSystemFontFamily.WantedSans.medium.swiftUIFont(size: UIFont.preferredFont(forTextStyle: .body).pointSize)
        case .callout:
            DesignSystemFontFamily.WantedSans.medium.swiftUIFont(size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
        case .footnote:
            DesignSystemFontFamily.WantedSans.regular.swiftUIFont(size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
        case .caption:
            DesignSystemFontFamily.WantedSans.medium.swiftUIFont(size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
        }
    }
    
    
    public var uiFont: UIFont {
        switch self {
        case .largeTitle:
            DesignSystemFontFamily.WantedSans.bold.font(size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
        case .title:
            DesignSystemFontFamily.WantedSans.semiBold.font(size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
        case .headline:
            DesignSystemFontFamily.WantedSans.semiBold.font(size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
        case .subheadline:
            DesignSystemFontFamily.WantedSans.semiBold.font(size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
        case .body:
            DesignSystemFontFamily.WantedSans.medium.font(size: UIFont.preferredFont(forTextStyle: .body).pointSize)
        case .callout:
            DesignSystemFontFamily.WantedSans.medium.font(size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
        case .footnote:
            DesignSystemFontFamily.WantedSans.regular.font(size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
        case .caption:
            DesignSystemFontFamily.WantedSans.medium.font(size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
        }
    }
}

public extension View {
    func font(_ font: GrowFont) -> some View {
        self.font(font.font)
    }
}
