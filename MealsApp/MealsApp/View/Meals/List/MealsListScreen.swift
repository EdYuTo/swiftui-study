//
//  MealsListScreen.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 12/02/23.
//

import SwiftUI

struct MealsListScreen: View {
    @StateObject
    private var viewModel = MealsListModel()
    @State
    private var viewDidLoad = false
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .foregroundColor(.brandPrimary)
        case .success(let meals, let meal):
            ZStack {
                List(
                    meals,
                    id: \.id
                ) { meal in
                    MealsItemView(meal: meal)
                        .onTapGesture {
                            viewModel.showDetails(meal)
                        }
                }
                .blur(radius: meal != nil ? 20 : 0)
                .disabled(meal != nil)
                
                if let meal = meal {
                    MealDetails(meal: meal) {
                        viewModel.popDetails()
                    }
                }
            }
        case .error:
            Button("Retry") {
                viewModel.getMealsList()
            }
        }
    }
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle("🍽️ Meals")
        }
        .alert(
            viewModel.alert.title,
            isPresented: $viewModel.alert.isShowing,
            presenting: viewModel.alert,
            actions: viewModel.alert.actions,
            message: viewModel.alert.message
        )
        .onAppear {
            if !viewDidLoad {
                viewDidLoad = true
                viewModel.getMealsList()
            }
        }
    }
}

struct MealsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealsListScreen()
    }
}
