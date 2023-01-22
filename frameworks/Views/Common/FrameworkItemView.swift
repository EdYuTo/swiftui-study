//
//  FrameworkItemView.swift
//  frameworks
//
//  Created by Edson Yudi Toma on 22/01/23.
//

import SwiftUI

struct FrameworkItemView: View {
    let framework: Framework
    
    var body: some View {
        VStack(spacing: 20) {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }.padding()
    }
}

struct FrameworkItemView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkItemView(
            framework: FrameworksDataMock.sampleFramework
        )
        .preferredColorScheme(.dark)
    }
}
