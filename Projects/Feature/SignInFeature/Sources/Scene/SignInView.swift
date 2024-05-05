import SwiftUI
import DesignSystem
import AuthServiceInterface
import BaseFeature

public struct SignInView: View {
    
    @ObservedObject private var viewModel: SignInViewModel
    @EnvironmentObject private var appState: AppState
    @State private var isSecured = true
    
    public init(
        viewModel: SignInViewModel
    ) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
        self.isSecured = isSecured
    }
    
    public var body: some View {
        VStack {
            GrowTextField("아이디를 입력해 주세요", text: $viewModel.id)
                .padding(.top, 24)
            GrowTextField("비밀번호를 입력해 주세요", text: $viewModel.pw, isSecured: isSecured)
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            isSecured.toggle()
                        } label: {
                            Image(systemName: isSecured ? "eye.slash.fill" : "eye.fill")
                                .foregroundStyle(.gray.opacity(0.5))
                        }
                        .applyAnimation()
                        .padding(.trailing, 8)
                    }
                }
            Spacer()
            GrowButton("도담도담 로그인") {
                await viewModel.signIn { token in
                    withAnimation {
                        appState.accessToken = token.accessToken
                        appState.refreshToken = token.refreshToken
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .growTopBar("로그인", hideBackButton: true)
        .hideKeyboardWhenTap()
        .alert("로그인에 실패했습니다", isPresented: $viewModel.showErrorDialog) {
            Button("확인", role: .none) {}
        }
    }
}
