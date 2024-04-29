import SwiftUI
import BaseFeature
import DesignSystem

public struct ProfileEditView: View {
    
    @ObservedObject private var viewModel = ProfileEditViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var text = ""
    public init() {}
    
    public var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    SubTitle("상태 메세지를 입력해 주세요")
                    InfinityTextField("", text: $text)
                    SubTitle("직군을 선택해 주세요")
                        .padding(.top, 32)
                    VStack(spacing: 28) {
                        ForEach(InfinityJobType.allCases, id: \.self) { job in
                            Button {
                                //
                            } label: {
                                HStack {
                                    let has = viewModel.jobs.contains(job)
                                    InfinityJob(job)
                                    Spacer()
                                    Image(systemName: has ? "checkmark.square.fill" : "checkmark.square")
                                        .font(.title2)
                                        .foregroundStyle(has ? Color.blue500 : Color.gray400)
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
            
            VStack {
                Spacer()
                InfinityButton("완료하기") {
                    dismiss()
                }
            }
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .infinityTopBar("프로필 설정")
        .hideKeyboardWhenTap()
    }
}
