//
//  HeaderView.swift
//  weather
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct HeaderViewModel {
    var location: String
    var image: String
    var iconSize: Double
    var temperature: Int
}

struct HeaderView: View {
    var model: HeaderViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            Text(model.location)
                .font(
                    .system(
                        size: 32,
                        weight: .medium,
                        design: .default
                    )
                )
                .foregroundColor(.white)
                .padding(.all)
            Image(systemName: model.image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: model.iconSize, height: model.iconSize)
            Text("\(model.temperature)°")
                .font(
                    .system(
                        size: 70,
                        weight: .medium
                    )
                )
                .foregroundColor(.white)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var iconSize: Double {
        let screenSize = UIScreen.main.bounds
        return min(screenSize.width, screenSize.height) * 0.5
    }
    
    static var previews: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.blue.gradient)
                .ignoresSafeArea()
            HeaderView(
                model: .init(
                    location: "Location",
                    image: "cloud.sun.fill",
                    iconSize: iconSize,
                    temperature: 76
                )
            )
        }
    }
}
