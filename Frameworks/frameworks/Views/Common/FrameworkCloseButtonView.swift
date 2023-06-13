//
//  FrameworkCloseButtonView.swift
//  frameworks
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct FrameworkCloseButtonView: View {
    
    var action: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                action?()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 48, height: 48)
            }
        }
        .padding()
    }
}

struct FrameworkCloseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkCloseButtonView()
            .preferredColorScheme(.dark)
    }
}
