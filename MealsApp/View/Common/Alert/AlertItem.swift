//
//  AlertItem.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 22/04/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    var message: String?
    var buttons: [AlertButton]
    var isShowing = false
}

extension AlertItem {
    init(_ error: NetworkError, onConfirm: VoidCallback? = nil) {
        switch error {
        case .invalidURL:
            title = "Invalid Url"
        case .invalidResponse:
            title = "Invalid response"
        case .invalidData:
            title = "Invalid data"
        case .unknown:
            title = "Unknown error"
            message = "I don't know what is going on"
        }
        buttons = [
            .init(title: "Ok") {
                onConfirm?()
            }
        ]
    }
}

extension AlertItem {
    @ViewBuilder
    func actions(alert: AlertItem) -> some View {
        ForEach(alert.buttons) { button in
            button.content
        }
    }
    
    @ViewBuilder
    func message(alert: AlertItem) -> some View {
        if let message = message {
            Text(message)
        } else {
            EmptyView()
        }
    }
}
