import SwiftUI

public enum GrowIconography {
    case add
    case addRing
    case arrowDown
    case arrowLeft
    case arrowRight
    case arrowUp
    case baekjoon
    case chat
    case check
    case closeFill
    case closeLine
    case closeRing
    case detailHorizontal
    case detailVertical
    case expandDown
    case expandLeft
    case expandRight
    case expandStopDown
    case expandStopLeft
    case expandStopRight
    case expandStopUp
    case expandUp
    case github
    case heart
    case hide
    case home
    case logout
    case moon
    case notification
    case person
    case ping
    case radio
    case radioUnselected
    case send
    case setting
    case show
    case write
    case addFill
    
    var icon: Image {
        switch self {
        case .add: DesignSystemAsset.add.swiftUIImage
        case .addRing: DesignSystemAsset.addRing.swiftUIImage
        case .arrowDown: DesignSystemAsset.arrowDown.swiftUIImage
        case .arrowLeft: DesignSystemAsset.arrowLeft.swiftUIImage
        case .arrowRight: DesignSystemAsset.arrowRight.swiftUIImage
        case .arrowUp: DesignSystemAsset.arrowUp.swiftUIImage
        case .baekjoon: DesignSystemAsset.baekjoon.swiftUIImage
        case .chat: DesignSystemAsset.chat.swiftUIImage
        case .check: DesignSystemAsset.check.swiftUIImage
        case .closeFill: DesignSystemAsset.closeFill.swiftUIImage
        case .closeLine: DesignSystemAsset.closeLine.swiftUIImage
        case .closeRing: DesignSystemAsset.closeRing.swiftUIImage
        case .detailHorizontal: DesignSystemAsset.detailHorizontal.swiftUIImage
        case .detailVertical: DesignSystemAsset.detailVertical.swiftUIImage
        case .expandDown: DesignSystemAsset.expandDown.swiftUIImage
        case .expandLeft: DesignSystemAsset.expandLeft.swiftUIImage
        case .expandRight: DesignSystemAsset.expandRight.swiftUIImage
        case .expandStopDown: DesignSystemAsset.expandStopDown.swiftUIImage
        case .expandStopLeft: DesignSystemAsset.expandStopLeft.swiftUIImage
        case .expandStopRight: DesignSystemAsset.expandStopRight.swiftUIImage
        case .expandStopUp: DesignSystemAsset.expandStopUp.swiftUIImage
        case .expandUp: DesignSystemAsset.expandUp.swiftUIImage
        case .github: DesignSystemAsset.github.swiftUIImage
        case .heart: DesignSystemAsset.heart.swiftUIImage
        case .hide: DesignSystemAsset.hide.swiftUIImage
        case .home: DesignSystemAsset.home.swiftUIImage
        case .logout: DesignSystemAsset.logout.swiftUIImage
        case .moon: DesignSystemAsset.moon.swiftUIImage
        case .notification: DesignSystemAsset.notification.swiftUIImage
        case .person: DesignSystemAsset.person.swiftUIImage
        case .ping: DesignSystemAsset.ping.swiftUIImage
        case .radio: DesignSystemAsset.radio.swiftUIImage
        case .radioUnselected: DesignSystemAsset.radioUnselected.swiftUIImage
        case .send: DesignSystemAsset.send.swiftUIImage
        case .setting: DesignSystemAsset.setting.swiftUIImage
        case .show: DesignSystemAsset.show.swiftUIImage
        case .write: DesignSystemAsset.write.swiftUIImage
        case .addFill: DesignSystemAsset.addFill.swiftUIImage
        }
    }
}
