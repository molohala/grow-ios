//
//  Theme.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct Theme {
    
    private init() {}
    
    public static func navigationBarColors(background : Color?,
       titleColor : Color? = nil, tintColor : Color? = nil ){
        
        let background = UIColor(background ?? .black)
        let titleColor = UIColor(titleColor ?? .black)
        let tintColor = UIColor(tintColor ?? .black)
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = background 
        
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
       
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance

        UINavigationBar.appearance().tintColor = tintColor
    }
}
