//
//  NetworkImageLoader.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 26/04/23.
//

import SwiftUI

final class NetworkImageLoader: ObservableObject {
    @Published
    var image = Image("")
    
    @Published
    var isLoading: Bool = true
    
    func load(url: String, placholder: Image = Image("placeholderFood")) {
        isLoading = true
        NetworkManager.shared.downloadImage(url: url) { [weak self] image in
            guard let self = self else { return }
            self.isLoading = false
            if let image = image {
                self.image = Image(uiImage: image)
            } else {
                self.image = placholder
            }
        }
    }
}
