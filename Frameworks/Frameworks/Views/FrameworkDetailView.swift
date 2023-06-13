//
//  FrameworkDetailView.swift
//  frameworks
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    let framework: Framework
    
    @State
    private var isShowingWebView = false
    
    var body: some View {
        VStack {
            Spacer()
            FrameworkItemView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            FrameworkButtonView(
                title: "Learn More"
            ) {
                isShowingWebView = true
            }
        }
        .sheet(isPresented: $isShowingWebView) {
            if let url = URL(string: framework.urlString) {
                SafariWebView(url: url)
            }
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(
            framework: FrameworksDataMock.sampleFramework
        )
        .preferredColorScheme(.dark)
    }
}
