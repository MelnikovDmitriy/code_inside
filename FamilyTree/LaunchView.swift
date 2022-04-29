//
//  LaunchView.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Colors.primaryBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Images.launchScreenImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                
                Text("знай свои корни")
                    .foregroundColor(Colors.primaryText)
                    .font(.title.bold())
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
