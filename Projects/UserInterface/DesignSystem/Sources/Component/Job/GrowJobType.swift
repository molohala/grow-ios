import SwiftUI

public enum GrowJobType: String, CaseIterable {
    case Server
    case Web
    case Android
    case iOS
    case Game
    case Designer
    case Developer
    
    var color: Color {
        switch self {
        case .Server: Color(0xBF2AE5)
        case .Web: Color(0x0094FF)
        case .Android: Color(0x0FAE15)
        case .iOS: Color(0xF64C41)
        case .Game: Color(0xFFB800)
        case .Designer: Color(0xF948E8)
        case .Developer: Color(0x848484)
        }
    }
    
    var background: Color {
        switch self {
        case .Server: Color(0xFAEDFF)
        case .Web: Color(0xECF7FF)
        case .Android: Color(0xDBFDE8)
        case .iOS: Color(0xFFF2ED)
        case .Game: Color(0xFCF7E5)
        case .Designer: Color(0xFFF5FD)
        case .Developer: Color(0xF7FAFF)
        }
    }
}
