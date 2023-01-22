//
//  WeatherView.swift
//  weather
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct WeatherButtonViewModel {
    var action: (() -> Void)? = nil
    var title: String
    var titleColor: Color = .blue
    var backgroundColor: Color = .white
}

struct WeatherButtonView: View {
    var model: WeatherButtonViewModel
    
    var body: some View {
        Button {
            model.action?()
        } label: {
            Text(model.title)
                .frame(width: 280, height: 50)
                .background(model.backgroundColor)
                .foregroundColor(model.titleColor)
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

struct WeatherButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButtonView(
            model: .init(
                title: "Button",
                titleColor: .white,
                backgroundColor: .blue
            )
        )
    }
}
