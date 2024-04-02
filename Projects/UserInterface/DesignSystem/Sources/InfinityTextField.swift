//
//  InfinityTextField.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct InfinityTextField: View {
    
    var hint: String
    @Binding var text: String
    
    public init(_ hint: String, text: Binding<String>) {
        self.hint = hint
        self._text = text
    }
    
    public var body: some View {
    
        TextField(hint, text: $text)
            .padding(15)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1.0)
                    .foregroundStyle(.gray.opacity(0.3))
            }
    }
}
