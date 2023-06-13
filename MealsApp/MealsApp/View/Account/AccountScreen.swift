//
//  AccountScreen.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 12/02/23.
//

import SwiftUI

struct AccountScreen: View {
    var body: some View {
        NavigationView {
            Text("Account")
                .navigationTitle("👜 Account")
        }
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
