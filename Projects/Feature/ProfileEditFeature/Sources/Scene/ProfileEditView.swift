import SwiftUI
import BaseFeature
import DesignSystem
import Flow

public struct ProfileEditView: View {
    
    @ObservedObject private var viewModel = ProfileEditViewModel()
    @EnvironmentObject private var router: Router
    @Environment(\.dismiss) private var dismiss
    @State private var text = ""
    public init() {}
    
    public var body: some View {
        VStack(spacing: 28) {
            VStack(spacing: 8) {
                GrowHeadline("소개글")
                    .toLeading()
                    .padding(.horizontal, 4)
                GrowTextField(text: $viewModel.bio)
            }
            VStack(spacing: 8) {
                GrowHeadline("직군")
                    .toLeading()
                    .padding(.horizontal, 4)
                HFlow(itemSpacing: 8, rowSpacing: 8) {
                    ForEach(viewModel.jobs, id: \.self) {
                        GrowRadioButton($0, isSelected: $0 == "Server") {
                            //
                        }
                    }
                }
                .toLeading()
            }
            VStack(spacing: 8) {
                GrowHeadline("언어")
                    .toLeading()
                    .padding(.horizontal, 4)
                HFlow(itemSpacing: 8, rowSpacing: 8) {
                    ForEach(viewModel.languages, id: \.self) {
                        GrowRadioButton($0, icon: .check, isSelected: $0 == "Python" || $0 == "HTML") {
                            //
                        }
                    }
                }
                .toLeading()
            }
            Spacer()
            GrowButton("완료", type: .CTA, leadingIcon: .check) {
                await viewModel.completeSetting()
            }
            .padding(.horizontal, 4)
        }
        .padding(.top, 20)
        .padding(.horizontal, 16)
        .growTopBar("프로필 설정", background: .backgroundAlt) {
            router.popToStack()
        }
        .hideKeyboardWhenTap()
    }
}
