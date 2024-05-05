//
//  ProfileEditListCell.swift
//  ProfileEditFeature
//
//  Created by dgsw8th71 on 4/5/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct SettingCell: View {
    
    private var icon: Image
    private var iconColor: Color
    private var text: String
    private var description: String?
    private var onClick: () -> Void
    
    public init(icon: Image, iconColor: Color, text: String, description: String? = nil, onClick: @escaping () -> Void) {
        self.icon = icon
        self.iconColor = iconColor
        self.text = text
        self.description = description
        self.onClick = onClick
    }
    
    public var body: some View {
        Button {
            onClick()
        } label: {
            HStack {
                icon
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(iconColor)
                Text(text)
                    .growFont(.callout)
                Spacer()
                if let description {
                    Text(description)
                        .growFont(.caption)
                        .foregroundStyle(.gray)
                }
                Icon.rightArrorIcon
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 12)
            .applyCardView()
        }
        .applyAnimation()
    }
}
