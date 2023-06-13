//
//  AlertButton.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 22/04/23.
//

import SwiftUI

struct AlertButton: Identifiable {
    let id = UUID()
    let title: String
    let action: VoidCallback?
}

extension AlertButton {
    @ViewBuilder
    var content: some View {
        Button(title) {
            action?()
        }
    }
}
