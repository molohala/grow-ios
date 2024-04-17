//
//  InfinitySelector.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/6/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinitySelector: View {
    
    private static let categoryHeight: CGFloat = 34
    
    var text: String
    var isSelected: Bool
    var action: () -> Void
    
    public init(
        text: String,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.isSelected = isSelected
        self.action = action
    }
    
    public var body: some View {
        
        let foregroundColor: Color = isSelected ? .white : .gray
        let backgroundColor: Color = isSelected ? Color.blue500 : .backgroundColor
        
        Button {
            action()
        } label: {
            Text(text)
                .font(.callout)
                .frame(height: Self.categoryHeight)
                .padding(.horizontal, 16)
                .foregroundStyle(foregroundColor)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: Self.categoryHeight / 2))
        }
        .applyAnimation()
    }
}
