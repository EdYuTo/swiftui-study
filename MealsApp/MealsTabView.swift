//
//  MealsTabView.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 12/02/23.
//

import SwiftUI

struct MealsTabView: View {
    var body: some View {
        TabView {
            MealsListScreen().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            OrdersListScreen().tabItem {
                Image(systemName: "bag")
                Text("Orders")
            }
            AccountScreen().tabItem {
                Image(systemName: "person")
                Text("Account")
            }
        }.accentColor(.brandPrimary)
    }
}

struct MealsTabView_Previews: PreviewProvider {
    static var previews: some View {
        MealsTabView()
    }
}
