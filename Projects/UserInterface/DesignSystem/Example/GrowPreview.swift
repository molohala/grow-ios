import SwiftUI
import DesignSystem

enum GrowPreview: String, CaseIterable {
    case Avatar
    case Button
    case Comment
    case Divider
    case Forum
    case RankCell
    case TextField
    case TopAppBar
    case SettingCell
    case Shimmer
    case StatCell
    
    var view: some View {
        Group {
            switch self {
            case .Avatar: AvatarPreview()
            case .Button: ButtonPreview()
            case .Comment: CommentPreview()
            case .Divider: DividerPreview()
            case .Forum: ForumPreview()
            case .RankCell: RankCellPreview()
            case .TextField: TextFieldPreview()
            case .TopAppBar: TopAppBarPreview()
            case .SettingCell: SettingCellPreview()
            case .Shimmer: ShimmerPreview()
            case .StatCell: StatCellPreview()
            }
        }
    }
    
    static var preview: some View {
        NavigationStack {
            ScrollView {
                ForEach(Self.allCases, id: \.self) { preview in
                    NavigationLink {
                        preview.view
                    } label: {
                        Text("\(preview.rawValue) Preview")
                            .padding()
                    }
                }
            }
        }
    }
}
