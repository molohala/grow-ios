import SwiftUI
import DesignSystem

public struct BaekjoonSettingView: View {
    
    @ObservedObject private var viewModel: BaekjoonSettingViewModel
    
    public init(
        viewModel: BaekjoonSettingViewModel
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            VStack {
                InfinityTextField("백준 Id를 입력해 주세요", text: $viewModel.backjoonId)
                
                Spacer()
                
                InfinityButton("완료하기") {
                }
                .disabled(viewModel.backjoonId.isEmpty)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .infinityTopBar("백준 설정")
    }
}
