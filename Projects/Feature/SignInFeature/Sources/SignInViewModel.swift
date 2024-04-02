//
//  SignInViewModel.swift
//  SignInFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

final class SignInViewModel: ObservableObject {
    
    // MARK: - State
    @Published var id = ""
    @Published var pw = ""
    
    
    // MARK: - Method
    @MainActor
    func signIn() async {
        do {
            
        } catch {
            
        }
    }
    
}
