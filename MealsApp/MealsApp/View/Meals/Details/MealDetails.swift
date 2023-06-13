//
//  MealDetails.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 26/04/23.
//

import SwiftUI

struct MealDetails: View {
    let meal: Meal
    let closeAction: VoidCallback
    
    var body: some View {
        FloatingCard {
            VStack {
                NetworkImage(url: meal.imageUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(widthScale: 0.76, heightScale: 0.26)
                VStack {
                    Text(meal.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(meal.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                    HStack(spacing: 40) {
                        MealInfoView(
                            title: "Calories",
                            description: "\(meal.calories)"
                        )
                        MealInfoView(
                            title: "Carbs",
                            description: "\(meal.carbs)"
                        )
                        MealInfoView(
                            title: "Protein",
                            description: "\(meal.protein)"
                        )
                    }
                }
                Spacer()
                Button("$\(meal.price, specifier: "%.2f") - Add to Order") {
                    
                }
                .padding(.bottom, 30)
            }
        } closeAction: {
            closeAction()
        }
    }
}

struct MealDetails_Previews: PreviewProvider {
    static var previews: some View {
        MealDetails(meal: MockData.sampleMeal) {
            print("Tap close")
        }
    }
}
