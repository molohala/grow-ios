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
            }
            
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .growTopBar("프로필 설정")
        .hideKeyboardWhenTap()
    }
}
