import SwiftUI
import DesignSystem
import AuthServiceInterface

public struct SignInView: View {
    
    @ObservedObject private var viewModel: SignInViewModel
    @State private var isSecured = true
    
    init(
        viewModel: SignInViewModel
    ) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
        self.isSecured = isSecured
    }
    
    public var body: some View {
        VStack {
            InfinityTextField("아이디를 입력해 주세요", text: $viewModel.id)
                .padding(.top, 24)
            InfinityTextField("비밀번호를 입력해 주세요", text: $viewModel.pw, isSecured: isSecured)
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
            InfinityButton("도담도담 로그인") {
                await viewModel.signIn()
            }
        }
        .padding(.horizontal, 16)
        .infinityTopBar("로그인")
        .hideKeyboardWhenTap()
        .alert("로그인에 실패했습니다", isPresented: $viewModel.showErrorDialog) {
            Button("확인", role: .none) {}
        }
    }
}
