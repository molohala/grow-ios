import SwiftUI
import DesignSystem

enum GrowPreview: String, CaseIterable {
    case Avatar
    case Button
    case Divider
    case TextField
    case TopAppBar
    case Shimmer
    case StatCell
    
    var view: some View {
        Group {
            switch self {
            case .Avatar: AvatarPreview()
            case .Button: ButtonPreview()
            case .Divider: DividerPreview()
            case .TextField: TextFieldPreview()
            case .TopAppBar: TopAppBarPreview()
            case .Shimmer: ShimmerPreview()
            case .StatCell: StatCellPreview()
            }
        }
    }
    
    static var preview: some View {
        NavigationStack {
//            List(Self.allCases, id: \.self) { preview in
//                NavigationLink {
//                    preview.view
//                } label: {
//                    Text("\(preview.rawValue) Preview")
//                }
//            }
            GrowPreview.StatCell.view
        }
    }
}
