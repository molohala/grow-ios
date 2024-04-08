//
//  InfinityTopBar.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityTopBar<C>: View where C: View {
    
    @Environment(\.dismiss) private var dismiss
    
    private let title: String
    private let background: Color
    private let content: () -> C
    private let hideBackButton: Bool
    
    public init(
        title: String,
        background: Color,
        hideBackButton: Bool,
        @ViewBuilder content: @escaping () -> C
    ) {
        self.title = title
        self.background = background
        self.hideBackButton = hideBackButton
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            content()
                .padding(.top, 58)
            VStack {
                HStack(spacing: 16) {
                    if !hideBackButton {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.headline)
                                .padding(.leading, 20)
                                .foregroundStyle(Color.black)
                        }
                    }
                    Text(title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.leading, hideBackButton ? 16 : 4)
                    Spacer()
                }
                .frame(height: 58)
                .background(background)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

public extension View {
    func infinityTopBar(_ title: String, background: Color = .white, hideBackButton: Bool = false) -> some View {
        InfinityTopBar(title: title, background: background, hideBackButton: hideBackButton) {
            self
        }
    }
}
