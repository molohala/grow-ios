//
//  SignInViewModel.swift
//  SignInFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import AuthService

final class SignInViewModel: ObservableObject {
    
    // MARK: - State
    @Published var id = ""
    @Published var pw = ""
    @Published var showErrorDialog = false
    
    // MARK: - Method
    @MainActor
    func signIn() async {
        do {
            let response = try await AuthService.shared.dodamSignIn(id: id, pw: pw).data
            guard let url = URL(string: response.location) else { 
                showErrorDialog = true
                return
            }
            
            guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                showErrorDialog = true
                return
            }
            
            guard let code = components.queryItems?.first(where: { $0.name == "code" }) else {
                showErrorDialog = true
                return
            }
            
            // handle sign in with dauth code
        } catch {
            showErrorDialog = true
            print(error)
        }
    }
}
