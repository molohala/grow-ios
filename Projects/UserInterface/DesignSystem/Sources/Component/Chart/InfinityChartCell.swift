//
//  InfinityGithubCell.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public enum ChartType: String, CaseIterable {
    case github = "Github"
    case baekjoon = "백준"
}


public struct InfinityChartCell: View {
    
    private let title: String
    private let subtitle: String
    private let subject: String
    private let chartData: InfinityChartData
    @Binding var selectedType: ChartType
    
    public init(
        title: String,
        subtitle: String,
        subject: String,
        chartData: InfinityChartData,
        selectedType: Binding<ChartType>
    ) {
        self.title = title
        self.subtitle = subtitle
        self.chartData = chartData
        self.subject = subject
        self._selectedType = selectedType
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
                Picker(selection: $selectedType) {
                    ForEach(ChartType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
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
