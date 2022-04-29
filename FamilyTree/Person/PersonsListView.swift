//
//  PersonsListView.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022
//

import SwiftUI

struct PersonsListView: View {
    @ObservedObject var model: MainViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text(model.personsListAction?.title ?? "")
                    .font(.subheadline)
                
                Text(model.personsListAction?.name ?? "")
                    .font(.headline)
                
                Divider()
            }
            .padding(.top, 32)
            
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(model.persons.sorted(by: { ($0.surname + $0.name + $0.patronymic) < ($1.surname + $1.name + $1.patronymic) })) { person in
                        HStack {
                            Image(systemName: "person.crop.artframe")
                                .resizable()
                                .frame(width: 35, height: 40)
                                .foregroundColor(.green)
                            
                            Text("\(person.surname) \(person.name) \(person.patronymic)")
                        }
                        .onTapGesture {
                            model.personsListAction?.select(person)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct PersonsListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsListView(model: MainViewModel())
    }
}
