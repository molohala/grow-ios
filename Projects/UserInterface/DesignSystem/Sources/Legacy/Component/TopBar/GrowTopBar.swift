//
//  InfinityTopBar.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct GrowTopBar<C>: View where C: View {
    
    @Environment(\.dismiss) private var dismiss
    
    private let title: String
    private let background: Color
    private let content: () -> C
    private let hideBackButton: Bool
    private let trailingContent: AnyView
    
    public init(
        title: String,
        background: Color,
        hideBackButton: Bool,
        trailingContent: AnyView = AnyView(EmptyView()),
        @ViewBuilder content: @escaping () -> C
    ) {
        self.title = title
        self.background = background
        self.hideBackButton = hideBackButton
        self.trailingContent = trailingContent
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
                    trailingContent
                        .padding(.trailing, 20)
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
    func growTopBar<TC>(
        _ title: String,
        background: Color = .white,
        hideBackButton: Bool = false,
        @ViewBuilder trailingContent: @escaping () -> TC = { EmptyView() }
    ) -> some View where TC: View {
        GrowTopBar(
            title: title,
            background: background,
            hideBackButton: hideBackButton,
            trailingContent: AnyView(trailingContent())
        ) {
            self
        }
    }
}
