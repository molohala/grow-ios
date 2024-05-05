//
//  InfinityTopBar.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct GrowTopAppBar<C>: View where C: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var colorProvider: ColorProvider
    
    private let title: String
    private let background: GrowColorScheme?
    private let content: () -> C
    private let backButtonAction: (() -> Void)?
    private let trailingContent: AnyView
    
    public init(
        title: String,
        background: GrowColorScheme?,
        backButtonAction: (() -> Void)?,
        trailingContent: AnyView = AnyView(EmptyView()),
        @ViewBuilder content: @escaping () -> C
    ) {
        self.title = title
        self.background = background
        self.backButtonAction = backButtonAction
        self.trailingContent = trailingContent
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            colorProvider.color(background ?? .backgroundAlt)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    if let backButtonAction {
                        Button {
                            backButtonAction()
                        } label: {
                            Image(.expandLeft)
                                .resizable()
                                .growIconColor(.textNormal)
                                .frame(size: 28)
                                .padding(2)
                        }
                    }
                    Text(title)
                        .growFont(backButtonAction == nil ? .title2B : .headline2M)
                        .growColor(.textNormal)
                        .padding(.leading, 8)
                    Spacer()
                    trailingContent
                }
                .frame(height: 54)
                .growBackground(background ?? .backgroundAlt)
                .padding(.horizontal, 4)
                content()
            }
            .toTop()
            .navigationBarBackButtonHidden()
        }
    }
}

public extension View {
    func growTopBar<TC>(
        _ title: String,
        background: GrowColorScheme? = nil,
        @ViewBuilder trailingContent: @escaping () -> TC = { EmptyView() },
        backButtonAction: (() -> Void)?
    ) -> some View where TC: View {
        GrowTopAppBar(
            title: title,
            background: background,
            backButtonAction: backButtonAction,
            trailingContent: AnyView(trailingContent())
        ) {
            self
        }
    }
}
