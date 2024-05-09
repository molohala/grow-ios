import SwiftUI
import BaseFeature
import DesignSystem
import Flow

public struct ProfileEditView: View {
    
    @StateObject private var viewModel: ProfileEditViewModel
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @Environment(\.dismiss) private var dismiss
    
    public init(
        viewModel: ProfileEditViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 28) {
                    VStack(spacing: 8) {
                        GrowHeadline("소개글")
                            .toLeading()
                            .padding(.horizontal, 4)
                        GrowTextEditor(text: $viewModel.bio)
                            .frame(minHeight: 100, maxHeight: 300)
                    }
                    VStack(spacing: 8) {
                        GrowHeadline("직군")
                            .toLeading()
                            .padding(.horizontal, 4)
                        if case .success(let jobs) = viewModel.jobs {
                            HFlow(itemSpacing: 8, rowSpacing: 8) {
                                ForEach(jobs, id: \.self) { job in
                                    GrowRadioButton(job.isEmpty ? "Developer" : job, isSelected: job == viewModel.selectedJob) {
                                        viewModel.selectedJob = job
                                    }
                                }
                            }
                            .toLeading()
                        }
                    }
                    VStack(spacing: 8) {
                        GrowHeadline("사용 언어")
                            .toLeading()
                            .padding(.horizontal, 4)
                        if case .success(let languages) = viewModel.languages,
                           case .success(let myLanguages) = viewModel.myLanguages {
                            HFlow(itemSpacing: 8, rowSpacing: 8) {
                                ForEach(languages, id: \.id) { lang in
                                    GrowRadioButton(lang.name, icon: .check, isSelected: myLanguages.contains(lang)) {
                                        viewModel.updateMyLanguages(lang: lang)
                                    }
                                }
                            }
                            .toLeading()
                        }
                    }
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal, 16)
                .padding(.bottom, 92)
            }
            .scrollIndicators(.hidden)
            GrowButton("완료", type: .CTA, leadingIcon: .check) {
                await viewModel.completeSetting()
            }
            .toBottom()
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
        }
        .growTopBar("프로필 설정", background: .backgroundAlt) {
            router.popToStack()
        }
        .hideKeyboardWhenTap()
        .onAppear {
            if case .success(let profile) = appState.profile {
                viewModel.bio = profile.bio
                viewModel.selectedJob = profile.job
            }
        }
        .task {
            async let fetchJobs: () = viewModel.fetchJobs()
            async let fetchLanguages: () = viewModel.fetchLanguages()
            async let fetchMyLanguages: () = viewModel.fetchMyLanguages()
            _ = await [fetchJobs, fetchLanguages, fetchMyLanguages]
        }
        .alert("프로필 정보 불러오기 실패", isPresented: $viewModel.showFetchFailureDialog) {
            Button("닫기", role: .cancel) {
                dismiss()
            }
        }
        .eraseToAnyView()
        .alert("프로필 정보 수정 실패", isPresented: $viewModel.showPatchFailureDialog) {
            Button("닫기", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("프로필 정보 수정 성공", isPresented: $viewModel.showPatchSuccessDialog) {
            Button("닫기", role: .cancel) {
                dismiss()
            }
        }
        .task(id: viewModel.showPatchSuccessDialog) {
            if viewModel.showPatchSuccessDialog {
                await appState.fetchProfile()
            }
        }
    }
}
