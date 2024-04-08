import SwiftUI
import BaseFeature
import DesignSystem
import CommunityFeatureInterface
import CommunityCreateFeatureInterface
import CommunityDetailFeatureInterface

public struct CommunityView: View {
    
    private var communityList = Array(0..<10)
    
    private let communityCreateBuildable: any CommunityCreateBuildable
    private let communityDetailBuildable: any CommunityDetailBuildable
    
    @EnvironmentObject private var router: Router
    
    public init(communityCreateBuildable: any CommunityCreateBuildable,
                communityDetailBuildable: any CommunityDetailBuildable) {
        self.communityCreateBuildable = communityCreateBuildable
        self.communityDetailBuildable = communityDetailBuildable
    }
    
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
        .navigationDestination(for: CommunityDestination.self) {
            switch $0 {
            case .communityCreate: communityCreateBuildable.makeView().eraseToAnyView()
            case .communityDetail: communityDetailBuildable.makeView().eraseToAnyView()
            }
        }
    }
}
