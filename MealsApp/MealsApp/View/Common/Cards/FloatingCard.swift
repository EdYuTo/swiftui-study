//
//  FloatingCard.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 26/04/23.
//

import SwiftUI

struct FloatingCard<T>: View where T: View {
    @ViewBuilder
    let child: T
    let closeAction: VoidCallback
    
    var body: some View {
        child
        .frame(widthScale: 0.76, heightScale: 0.62)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            CloseButton(action: closeAction)
        }
    }
}

struct FloatingCard_Previews: PreviewProvider {
    static var previews: some View {
        FloatingCard {
            Text("Floating card")
        } closeAction: {
            print("Tap close")
        }
    }
}
