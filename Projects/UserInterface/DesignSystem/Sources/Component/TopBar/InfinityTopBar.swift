//
//  InfinityTopBar.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityTopBar<C>: View where C: View {
    
    private let title: String
    private let background: Color
    private let content: () -> C
    
    public init(
        title: String,
        background: Color,
        @ViewBuilder content: @escaping () -> C
    ) {
        self.title = title
        self.background = background
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            content()
                .padding(.top, 58)
            VStack {
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.leading, 16)
                    Spacer()
                }
                .frame(height: 58)
                .background(background)
                Spacer()
            }
        }
    }
}

public extension View {
    func infinityTopBar(_ title: String, background: Color = .white) -> some View {
        InfinityTopBar(title: title, background: background) {
            self
        }
    }
}
