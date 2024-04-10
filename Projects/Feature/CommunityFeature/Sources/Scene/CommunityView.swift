import SwiftUI
import BaseFeature
import DesignSystem
import CommunityFeatureInterface

public struct CommunityView: View {
    
    private var communityList = Array(0..<10)
    
    @EnvironmentObject private var router: Router
    
    public init() {}
    
    public var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(communityList, id: \.self) { _ in
                        InfinityCommunityCell {
                            router.navigate(to: CommunityDestination.communityDetail)
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 128)
            }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button {
                        router.navigate(to: CommunityDestination.communityCreate)
                    } label: {
                        Circle()
                            .frame(width: 64, height: 64)
                            .foregroundStyle(.blue)
                            .overlay {
                                Image(systemName: "square.and.pencil")
                                    .foregroundStyle(.white)
                            }
                    }
                    .applyAnimation()
                    .padding(.trailing, 24)
                    .padding(.bottom, 92)
                }
            }
        }
        .background(Color.backgroundColor)
    }
}
