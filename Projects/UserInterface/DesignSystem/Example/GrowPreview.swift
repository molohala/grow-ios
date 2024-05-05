import SwiftUI
import DesignSystem

enum GrowPreview: String, CaseIterable {
    case Avatar
    case Button
    case Divider
    case TextField
    case TopAppBar
    
    var view: some View {
        Group {
            switch self {
            case .Avatar: AvatarPreview()
            case .Button: ButtonPreview()
            case .Divider: DividerPreview()
            case .TextField: TextFieldPreview()
            case .TopAppBar: TopAppBarPreview()
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
            GrowPreview.TextField.view
        }
    }
}
