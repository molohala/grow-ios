import SwiftUI
import DesignSystem

public struct SignInView: View {
    
    public init() {}
    
    @ObservedObject private var viewModel = SignInViewModel()
    
    public var body: some View {
        VStack {
            InfinityTextField("아이디를 입력해 주세요", text: $viewModel.id)
                .padding(.top, 24)
            InfinityTextField("비밀번호를 입력해 주세요", text: $viewModel.pw)
            Spacer()
            InfinityButton("도담도담 로그인") {
                await viewModel.signIn()
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("로그인")
        .hideKeyboardWhenTap()
    }
}
