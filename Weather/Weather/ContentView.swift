//
//  ContentView.swift
//  weather
//
//  Created by Edson Yudi Toma on 23/10/22.
//

import SwiftUI

struct ContentView: View {
    @State
    private var isNight = false

    var iconSize: Double {
        let screenSize = UIScreen.main.bounds
        return min(screenSize.width, screenSize.height) * 0.5
    }
    
    var weekData = [
        WeatherDayViewModel(
            dayOfWeek: "TUE",
            imageName: "cloud.sun.fill",
            temperature: 74
        ),
        WeatherDayViewModel(
            dayOfWeek: "WED",
            imageName: "sun.max.fill",
            temperature: 88
        ),
        WeatherDayViewModel(
            dayOfWeek: "THU",
            imageName: "wind.snow",
            temperature: 55
        ),
        WeatherDayViewModel(
            dayOfWeek: "FRI",
            imageName: "sunset.fill",
            temperature: 60
        ),
        WeatherDayViewModel(
            dayOfWeek: "SAT",
            imageName: "snow",
            temperature: 25
        )
    ]
    
    var body: some View {
        ZStack {
            BackgroundGradientView(
                model: .init(
                    topColor: isNight ? .black : .blue,
                    bottomColor: isNight ? .gray : Color("lightBlue")
                )
            )
            VStack {
                HeaderView(
                    model: .init(
                        location: "Cupertino, CA",
                        image: "cloud.sun.fill",
                        iconSize: iconSize,
                        temperature: 76
                    )
                )
                    .padding(.bottom, 20)
                HStack(spacing: 20) {
                    ForEach(weekData, id: \.id) { data in
                        WeatherDayView(model: data, iconSize: iconSize * 0.25)
                    }
                }.padding()
                Spacer()
                WeatherButtonView(
                    model: .init(
                        action: {
                            isNight = !isNight
                        },
                        title: "Change Theme"
                    )
                )
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
