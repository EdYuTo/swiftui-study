//
//  FrameworkListView.swift
//  frameworks
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject
    var viewModel = FrameworkListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(FrameworksDataMock.frameworks, id: \.name) { framework in
                        FrameworkItemView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(
                    framework: viewModel.selectedFramework ?? FrameworksDataMock.sampleFramework
                ) {
                    viewModel.selectedFramework = nil
                }
            }
        }
    }
}

struct FrameworkListViewView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
            .preferredColorScheme(.dark)
    }
}
