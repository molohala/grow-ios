//
//  InfinityGithubCell.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityChartCell: View {
    
    private let title: String
    private let subtitle: String
    private let subject: String
    private let chartData: InfinityChartData
    private let tapped: () -> Void
    
    public init(
        title: String,
        subtitle: String,
        subject: String,
        chartData: InfinityChartData,
        tapped: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.chartData = chartData
        self.subject = subject
        self.tapped = tapped
    }
    
    public var body: some View {
        VStack(spacing: 24) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    Text(title)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
                Spacer()
                    .foregroundStyle(.gray)
                Button {
                    tapped()
                } label: {
                    HStack(spacing: 4) {
                        Text(subject)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        Icon.downArrorIcon
                    }
                }
                .applyAnimation()
                .padding(8)
            }
            InfinityChart(chartData: chartData)
                .frame(height: 200)
        }
        .applyCardView()
    }
}
