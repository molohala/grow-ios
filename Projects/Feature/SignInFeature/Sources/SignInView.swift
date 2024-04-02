import SwiftUI

public struct SignInView: View {
    
    public init() {}
    
    @ObservedObject private var viewModel = SignInViewModel()
    
    public var body: some View {
        VStack {
            TextField("아이디를 입력해 주세요", text: $viewModel.id)
            TextField("비밀번호를 입력해 주세요", text: $viewModel.pw)
            Spacer()
            
        }
    }
}
