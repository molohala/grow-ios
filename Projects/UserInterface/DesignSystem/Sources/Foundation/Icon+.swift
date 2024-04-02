//
//  Icon+.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct Icon {
    private init() {}
}

public extension Icon {
    static let rightArrorIcon: some View = Image(systemName: "chevron.forward")
        .foregroundStyle(.gray)
        .font(.body)
    
    static let logoutIcon: some View = Image(systemName: "rectangle.portrait.and.arrow.right")
        .font(.body)
        .foregroundStyle(.red)
}
