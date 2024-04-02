import SwiftUI
import BaseFeature
import HomeFeature
import RankFeature
import ProfileFeature

public struct MainView: View {
    
    public init() {}
    
    public var body: some View {
        TabView {
            RankView()
        }
    }
}
