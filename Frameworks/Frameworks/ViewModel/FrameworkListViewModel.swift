//
//  FrameworkListViewModel.swift
//  frameworks
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

final class FrameworkListViewModel: ObservableObject {
    
    let frameworks = FrameworksDataMock.frameworks
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
}
