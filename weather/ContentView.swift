//
//  ContentView.swift
//  weather
//
//  Created by Edson Yudi Toma on 23/10/22.
//

import SwiftUI

struct ContentView: View {
    var iconSize: Double {
        let screenSize = UIScreen.main.bounds
        return min(screenSize.width, screenSize.height) * 0.5
    }
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundGradient(
                topColor: isNight ? .black : .blue,
                bottomColor: isNight ? .gray : Color("lightBlue")
            )
            VStack {
                HeaderView(
                    location: "Cupertino, CA",
                    image: "cloud.sun.fill",
                    iconSize: iconSize,
                    temperature: 76
                )
                    .padding(.bottom, 20)
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 74,
                        iconSize: iconSize * 0.25
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 88,
                        iconSize: iconSize * 0.25
                    )
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "wind.snow",
                        temperature: 55,
                        iconSize: iconSize * 0.25
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sunset.fill",
                        temperature: 60,
                        iconSize: iconSize * 0.25
                    )
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "snow",
                        temperature: 25,
                        iconSize: iconSize * 0.25
                    )
                }.padding()
                Spacer()
                WeatherButton(
                    action: {
                        isNight = !isNight
                    },
                    title: "Hello"
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

struct WeatherButton: View {
    var action: (() -> Void)? = nil
    var title: String
    var titleColor: Color = .blue
    var backgroundColor: Color = .white
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(titleColor)
                .font(
                    .system(
                        size: 20,
                        weight: .bold,
                        design: .default
                    )
                )
                .cornerRadius(10)
        }
    }
}

struct BackgroundGradient: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(
            gradient: .init(
                colors: [
                    topColor, bottomColor
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).edgesIgnoringSafeArea(.all)
    }
}

struct HeaderView: View {
    var location: String
    var image: String
    var iconSize: Double
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(location)
                .font(
                    .system(
                        size: 32,
                        weight: .medium,
                        design: .default
                    )
                )
                .foregroundColor(.white)
                .padding(.all)
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: iconSize, height: iconSize)
            Text("\(temperature)°")
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

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var iconSize: Double
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(
                    .system(
                        size: 16,
                        weight: .medium,
                        design: .default
                    )
                )
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: iconSize, height: iconSize)
            Text("\(temperature)°")
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
