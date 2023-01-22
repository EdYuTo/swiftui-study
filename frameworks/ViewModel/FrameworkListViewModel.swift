//
//  FrameworkListViewModel.swift
//  frameworks
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

final class FrameworkListViewModel: ObservableObject {
    @Published
    var isShowingDetailView = false
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = selectedFramework != nil
        }
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
}
