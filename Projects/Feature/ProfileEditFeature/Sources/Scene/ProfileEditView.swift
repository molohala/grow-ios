import SwiftUI
import BaseFeature
import DesignSystem

public struct ProfileEditView: View {
    
    @ObservedObject private var viewModel = ProfileEditViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack {
            Text("\(viewModel.jobs.description)")
            
            Spacer()
            
            InfinityButton("완료하기") {
            }
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .navigationTitle("프로필 설정")
    }
}
