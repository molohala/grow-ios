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
    
    // MARK: - Method
    @MainActor
    func signIn() async {
        do {
            let response = try await AuthService.shared.dodamSignIn(.init(id: id, pw: pw, clientId: "", redirectUrl: "")).data
            let url = URL(string: response.location)!
            print(url.absoluteString)
        } catch {
            print(error)
        }
    }
}
