//
//  FamilyTreeApp.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022.
//

import SwiftUI

@main
struct FamilyTreeApp: App {
    @State private var isMainViewPresented = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                MainView()
                    .zIndex(0)
                
                if !isMainViewPresented {
                    LaunchView()
                        .zIndex(1)
                        .transition(.scale(scale: 4).combined(with: .opacity))
                }
            }
            .animation(.easeInOut, value: isMainViewPresented)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isMainViewPresented.toggle()
                }
            }
        }
    }
}
