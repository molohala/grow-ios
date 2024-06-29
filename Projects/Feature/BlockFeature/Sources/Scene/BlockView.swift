import SwiftUI
import MyDesignSystem
import BaseFeature

struct BlockView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var blockManager: BlockManager
    
    @State private var showBlockDialog = false
    @State private var selectedBlockUserId: Int?
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                Spacer().frame(height: 12)
                switch blockManager.blockedUser {
                case .fetching:
                    ProgressView()
                case .success(let data):
                    ForEach(data, id: \.id) { user in
                        BlockedUserCell(name: user.name) {
                            showBlockDialog = true
                            selectedBlockUserId = user.id
                        }
                    }
                case .failure:
                    EmptyView()
                }
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
        .myTopBar("차단한 유저", background: .backgroundAlt) {
            dismiss()
        }
        .alert("해당 유저를 차단 해제 하시겠습니까?", isPresented: $showBlockDialog) {
            Button("아니요", role: .cancel) {}
            Button("해제", role: .none) {
                guard let selectedBlockUserId else { return }
                Task {
                    await blockManager.allow(blockUserId: selectedBlockUserId)
                }
            }
        }
        .task {
            await blockManager.fetchBlockedUsers()
        }
    }
}
