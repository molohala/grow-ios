//
//  SignInViewModel.swift
//  SignInFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import AuthServiceInterface

final class SignInViewModel: ObservableObject {
    
    // MARK: - State
    @Published var id = ""
    @Published var pw = ""
    @Published var showErrorDialog = false
    
    private let signInUseCase: any SignInUseCase
    private let dAuthSignInUseCase: any DAuthSignInUseCase
    
    init(
        signInUseCase: any SignInUseCase,
        dAuthSignInUseCase: any DAuthSignInUseCase
    ) {
        self.signInUseCase = signInUseCase
        self.dAuthSignInUseCase = dAuthSignInUseCase
    }
    
    // MARK: - Method
    @MainActor
    func signIn() async {
        do {
            let response = try await dAuthSignInUseCase.excute(id: id, pw: pw)
            guard let url = URL(string: response.location) else {
                showErrorDialog = true
                return
            }
            
            guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                showErrorDialog = true
                return
            }
            
            guard let code = components.queryItems?.first(where: { $0.name == "code" })?.value else {
                showErrorDialog = true
                return
            }
            
            print(code)
            
//            let res = try await signInUseCase.excute(code: code)
//            print(res)
        } catch {
            showErrorDialog = true
            print(error)
        }
    }
}
