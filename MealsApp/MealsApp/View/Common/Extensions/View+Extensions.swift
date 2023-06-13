//
//  View+Extensions.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 26/04/23.
//

import SwiftUI

extension View {
    @inlinable
    func frame(widthScale: CGFloat = 1, heightScale: CGFloat = 1, alignment: Alignment = .center) -> some View {
        frame(width: .screenWidth(widthScale), height: .screenHeight(heightScale), alignment: alignment)
    }
}
