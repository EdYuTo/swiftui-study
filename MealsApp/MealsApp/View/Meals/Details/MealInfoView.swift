//
//  MealInfoView.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 26/04/23.
//

import SwiftUI

struct MealInfoView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.caption)
            Text(description)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct MealInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MealInfoView(title: "title", description: "description")
    }
}
