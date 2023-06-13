//
//  OrdersListScreen.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 12/02/23.
//

import SwiftUI

struct OrdersListScreen: View {
    var body: some View {
        NavigationView {
            Text("Orders!")
                .navigationTitle("🧾 Orders")
        }
    }
}

struct OrdersListScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListScreen()
    }
}
