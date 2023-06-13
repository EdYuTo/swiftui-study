//
//  FrameworkButtonView.swift
//  frameworks
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct FrameworkButtonView: View {
    
    let title: String
    var action: (() -> Void)? = nil
    var darkBrackgroundColor = Color.red.gradient
    var lightBrackgroundColor = Color.blue.gradient
    var darkForegroundColor = Color.white
    var lightForegroundColor = Color.white
    
    @Environment(\.colorScheme)
    private var colorScheme
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50)
                .background(
                    colorScheme == .dark ? darkBrackgroundColor : lightBrackgroundColor
                )
                .foregroundColor(
                    colorScheme == .dark ? darkForegroundColor : lightForegroundColor
                )
                .cornerRadius(10)
        }
    }
}

struct FrameworkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkButtonView(
            title: "Button"
        )
        .preferredColorScheme(.dark)
    }
}
