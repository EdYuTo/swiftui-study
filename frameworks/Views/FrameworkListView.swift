//
//  FrameworkListView.swift
//  frameworks
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct FrameworkListView: View {
    
    let viewModel = FrameworkListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.frameworks, id: \.name) { framework in
                    NavigationLink(
                        destination: FrameworkDetailView(framework: framework)
                    ) {
                        FrameworkItemView(framework: framework)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
    }
}

struct FrameworkListViewView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
            .preferredColorScheme(.dark)
    }
}
