//
//  BackgroudGradientView.swift
//  weather
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct BackgroundGradientViewModel {
    var topColor: Color
    var bottomColor: Color
}

struct BackgroundGradientView: View {
    var model: BackgroundGradientViewModel
    
    var body: some View {
        LinearGradient(
            gradient: .init(
                colors: [
                    model.topColor,
                    model.bottomColor
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView(
            model: .init(
                topColor: .blue,
                bottomColor: Color("lightBlue")
            )
        )
    }
}
