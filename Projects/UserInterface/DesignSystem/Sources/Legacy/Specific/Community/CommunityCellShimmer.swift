//import SwiftUI
//import CommunityServiceInterface
//
//public struct CommunityCellShimmer: View {
//    
//    public init() {}
//    
//    public var body: some View {
//        label
//    }
//    
//    @ViewBuilder
//    private var label: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            profile
//            VStack(alignment: .leading, spacing: 8) {
//                Text(Array(repeating: "-", count: .random(in: 20..<40)).joined())
//                    .lineSpacing(.growLineSpacing)
//                    .font(.callout)
//                    .fontWeight(.medium)
//                Text(Array(repeating: "-", count: .random(in: 10..<20)).joined())
//                    .lineSpacing(.growLineSpacing)
//                    .font(.callout)
//                    .fontWeight(.medium)
//            }
//        }
//        .applyCardView()
//    }
//    
//    @ViewBuilder
//    private var profile: some View {
//        HStack(spacing: 0) {
//            Circle()
//                .foregroundStyle(.gray)
//                .frame(width: 36, height: 36)
//            VStack(alignment: .leading, spacing: 2) {
//                Text("------------")
//            }
//            .padding(.leading, 8)
//            Spacer()
//        }
//    }
//}
