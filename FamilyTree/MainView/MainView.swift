//
//  MainView.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022
//

import SwiftUI

struct MainView: View {
    @StateObject private var model = MainViewModel()
    
    @State private var treeScale: CGFloat = 1
    @State private var lastTreeScaleValue: CGFloat = 1
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Colors.primaryBackground
                .edgesIgnoringSafeArea(.all)
                .background(ActivityView(isPresented: $model.isActivityViewPresented))
            
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Images.launchScreenImage
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Генеалогическое древо Софьи Петровой")
                        .font(.headline)
                        .foregroundColor(Colors.primaryText)
                }
                .padding([.horizontal, .top], 16)
                
                Divider()
                
                ScrollView([.horizontal, .vertical]) {
                    if model.persons.isEmpty {
                        PersonEmptyTreeView(model: model)
                        
                    } else {
                        TreeView(model: model, direction: .root, person: model.persons[13]) { person in
                            ZStack(alignment: .topTrailing) {
                                PersonView(person: person, model: model)
                                
                                if model.editingMode {
                                    Button(action: { model.removePerson(person) }) {
                                        Image(systemName: "xmark.circle")
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        .padding(32)
                        .background(Colors.primaryBackground)
                        .scaleEffect(treeScale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    let delta = value / lastTreeScaleValue
                                    lastTreeScaleValue = value
                                    treeScale = treeScale * delta
                                }
                                .onEnded { value in
                                    lastTreeScaleValue = 1.0
                                }
                        )
                    }
                }
            }
            
            HStack {
                Spacer()
                
                if model.isBottomMenuPresented {
                    HStack {
                        Button(action: {} ) {
                            Image(systemName: "plus.app")
                                .padding()
                                .background(.ultraThickMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        
                        Button(action: { model.isActivityViewPresented.toggle() } ) {
                            Image(systemName: "square.and.arrow.up")
                                .padding()
                                .background(.ultraThickMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        
                        Button(action: {}) {
                            Image(systemName: model.editingMode ? "trash.slash" : "trash")
                                .padding()
                                .background(.ultraThickMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                Button(action: { model.isBottomMenuPresented.toggle() }) {
                    Image(systemName: model.isBottomMenuPresented ? "xmark" : "ellipsis.circle")
                        .padding()
                        .background(.ultraThickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .animation(.spring(), value: model.isBottomMenuPresented)
            .padding()
        }
        .sheet(
            isPresented: .constant(model.selectedPerson != nil),
            onDismiss: model.releaseSelectedPerson,
            content: { PersonEditView(model: model) }
        )
        .animation(.easeInOut, value: model.persons)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
