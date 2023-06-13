//
//  NetworkImage.swift
//  MealsApp
//
//  Created by Edson Yudi Toma on 26/04/23.
//

import SwiftUI

struct NetworkImage: View {
    @StateObject
    private var loader = NetworkImageLoader()
    
    let url: String
    
    @ViewBuilder
    var content: some View {
        if loader.isLoading {
            ProgressView()
                .id(UUID())
                .foregroundColor(.brandPrimary)
        } else {
            loader.image.resizable()
        }
    }
    
    var body: some View {
        content.onAppear {
            loader.load(url: url)
        }
    }
}
