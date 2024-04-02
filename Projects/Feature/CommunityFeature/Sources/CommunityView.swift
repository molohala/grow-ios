import SwiftUI
import BaseFeature
import DesignSystem

public struct CommunityView: View {
    
    private var communityList = Array(0..<10)
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(communityList, id: \.self) { _ in
                    CommunityCell()
                        .padding(.horizontal, 16)
                }
            }
            .padding(.bottom, 128)
        }
    }
}
