//
//  CloseButton.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 26/04/23.
//

import SwiftUI

struct CloseButton: View {
    let action: VoidCallback
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.brandPrimary)
                .onTapGesture {
                    action()
                }
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton {
            print("Tap close")
        }
    }
}
