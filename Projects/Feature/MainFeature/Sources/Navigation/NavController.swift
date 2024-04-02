//
//  NavController.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import BaseFeature

public final class NavController: ObservableObject {
    @Published public var navigationPath: [ViewType.Main] = []
}
