//
//  CGFloat+Extensions.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 26/04/23.
//

import UIKit

extension CGFloat {
    @usableFromInline
    static func screenWidth(_ scale: CGFloat = 1) -> CGFloat {
        UIScreen.main.bounds.width * scale
    }
    
    @usableFromInline
    static func screenHeight(_ scale: CGFloat = 1) -> CGFloat {
        UIScreen.main.bounds.height * scale
    }
}
