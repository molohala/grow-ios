//
//  InfinityTabView.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import BaseFeature

public struct InfinityTabView: View {
    @Binding var selectedTab: MainFlow
    private let proxy: GeometryProxy
    
    public init(
        selectedTab: Binding<MainFlow>,
        proxy: GeometryProxy
    ) {
        self._selectedTab = selectedTab
        self.proxy = proxy
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            let mainViews = MainFlow.allCases
            Spacer()
            ForEach(mainViews, id: \.self) { tab in
                Button {
                    if selectedTab != tab {
                        selectedTab = tab
                    }
                } label: {
                    let width = proxy.size.width / 5 - 4
                    InfinityTabCell(type: tab, isSelected: selectedTab == tab)
                        .frame(width: width > 0 ? width : 0)
                }
                .applyAnimation()
            }
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .onChange(of: selectedTab) { _ in
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
        }
    }
}
