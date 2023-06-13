//
//  WeatherDayView.swift
//  weather
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct WeatherDayViewModel {
    let id = UUID()
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
}

struct WeatherDayView: View {
    var model: WeatherDayViewModel
    var iconSize: Double
    
    var body: some View {
        VStack {
            Text(model.dayOfWeek)
                .font(
                    .system(
                        size: 16,
                        weight: .medium,
                        design: .default
                    )
                )
                .foregroundColor(.white)
            Image(systemName: model.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: iconSize, height: iconSize)
            Text("\(model.temperature)°")
                .font(
                    .system(
                        size: 28,
                        weight: .medium,
                        design: .default
                    )
                )
                .foregroundColor(.white)
        }
    }
}

struct WeatherDayView_Previews: PreviewProvider {
    static var iconSize: Double {
        let screenSize = UIScreen.main.bounds
        return min(screenSize.width, screenSize.height) * 0.5
    }
    
    static var previews: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.blue.gradient)
                .ignoresSafeArea()
            WeatherDayView(
                model: .init(
                    dayOfWeek: "DAY",
                    imageName: "cloud.sun.fill",
                    temperature: 74
                ),
                iconSize: iconSize
            )
        }
    }
}
