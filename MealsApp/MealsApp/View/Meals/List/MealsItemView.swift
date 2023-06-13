//
//  MealsItemView.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 22/04/23.
//

import SwiftUI

struct MealsItemView: View {
    var meal: Meal
    
    var body: some View {
        HStack {
            NetworkImage(url: meal.imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5) {
                Text(
                    meal.name
                )
                .font(.title2)
                .fontWeight(.medium)
                Text(
                    "\(meal.price, specifier: "%.2f")"
                )
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct MealsItemView_Previews: PreviewProvider {
    static var previews: some View {
        MealsItemView(meal: MockData.sampleMeal)
    }
}
