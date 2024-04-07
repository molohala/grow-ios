//
//  MainViewModel.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published public var selectedView: MainViewType = .Home
}
