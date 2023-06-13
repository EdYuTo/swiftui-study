//
//  MealsListModel.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 22/04/23.
//

import SwiftUI

final class MealsListModel: ObservableObject {
    @Published
    var alert = AlertItem(.unknown)
    
    @Published
    var state: State = .loading
    
    func getMealsList() {
        state = .loading
        NetworkManager.shared.getAppetizers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let meals):
                self.state = .success(meals, nil)
            case .failure(let error):
                if let error = error as? NetworkError {
                    self.alert = AlertItem(error)
                }
                self.alert.isShowing = true
                self.state = .error
            }
        }
    }
    
    func showDetails(_ meal: Meal) {
        if case let .success(meals, _) = state {
            state = .success(meals, meal)
        }
    }
    
    func popDetails() {
        if case let .success(meals, _) = state {
            state = .success(meals, nil)
        }
    }
}

// MARK: State
extension MealsListModel {
    enum State {
        case loading
        case success([Meal], Meal?)
        case error
    }
}
