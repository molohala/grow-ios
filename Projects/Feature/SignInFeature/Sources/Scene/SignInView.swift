import SwiftUI
import DesignSystem
import AuthServiceInterface
import BaseFeature
import MyDesignSystem

public struct SignInView: View {
    
    @ObservedObject private var viewModel: SignInViewModel
    @EnvironmentObject private var appState: AppState
    
    public init(
        viewModel: SignInViewModel
    ) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack(spacing: 12) {
            MyTextField("아이디를 입력해 주세요", text: $viewModel.id)
                .padding(.top, 20)
            MyTextField("비밀번호를 입력해 주세요", text: $viewModel.pw, isSecured: true)
            Spacer()
            MyButton("도담도담 로그인", type: .CTA) {
                await viewModel.signIn { token in
                    withAnimation {
                        appState.accessToken = token.accessToken
                        appState.refreshToken = token.refreshToken
                    }
                }
            }
            .padding(.bottom, 8)
        }
        .padding(.horizontal, 16)
        .myTopBar("로그인")
        .hideKeyboardWhenTap()
        .alert("로그인에 실패했습니다", isPresented: $viewModel.showErrorDialog) {
            Button("확인", role: .none) {}
        }
    }
}
