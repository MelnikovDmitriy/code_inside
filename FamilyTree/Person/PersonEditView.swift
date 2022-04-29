//
//  PersonEditView.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022.
//

import SwiftUI

struct PersonEditView: View {
    @ObservedObject var model: MainViewModel
    
    @State private var name = "Иван"
    @State private var patronymic = "Евгеньевич"
    @State private var surname = "Петренко"
    @State private var birthDate = Date.future
    @State private var deathDate = Date.future
    @State private var hometown = "Москва"
    @State private var occupation = "Невролог"
    @State private var avatarLink = "https://www.ok.ru"
    @State private var parents = [UUID]()
    @State private var children = [UUID]()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 32) {
                Button(action: {}) {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .frame(width: 117, height: 100)
                        .foregroundColor(.blue)
                        .opacity(0.35)
                }
                .padding(.vertical, 16)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 32) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Фамилия")
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                            
                            TextField("", text: $surname)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Имя")
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                            
                            TextField("", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Отчество")
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                            
                            TextField("", text: $patronymic)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Годы жизни")
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                            
                            HStack {
                                Text("C:")
                                    .font(.callout)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                                
                                if birthDate == .future {
                                    Button(action: { birthDate = Date() }) {
                                        Label("", systemImage: "plus.circle")
                                    }
                                    
                                } else {
                                    DatePicker("", selection: $birthDate, displayedComponents: .date)
                                        .labelsHidden()
                                        .datePickerStyle(CompactDatePickerStyle())
                                }
                            }
                            
                            HStack {
                                Text("По:")
                                    .font(.callout)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                                
                                if deathDate == .future {
                                    Button(action: { deathDate = Date() }) {
                                        Label("", systemImage: "plus.circle")
                                    }
                                    
                                } else {
                                    DatePicker("", selection: $deathDate, displayedComponents: .date)
                                        .labelsHidden()
                                        .datePickerStyle(CompactDatePickerStyle())
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Родной город")
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                            
                            TextField("", text: $hometown)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Профессия")
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                            
                            TextField("", text: $occupation)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        let parentsArray = model.findParents(parents)
                        if !parentsArray.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Родители")
                                    .font(.callout)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                                
                                HStack(alignment: .top, spacing: 16) {
                                    ForEach(parentsArray) { parent in
                                        ZStack(alignment: .topTrailing) {
                                            PersonView(person: parent, model: model)
                                                .disabled(true)
                                            
                                            Button(action: { parents.removeAll(where: { $0 == parent.id }) }) {
                                                Image(systemName: "xmark.circle")
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        let childrenArray = model.findChildren(children)
                        if !childrenArray.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Дети")
                                    .font(.callout)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                                
                                ScrollView(.horizontal) {
                                    HStack(alignment: .top, spacing: 16) {
                                        ForEach(childrenArray) { child in
                                            ZStack(alignment: .topTrailing) {
                                                PersonView(person: child, model: model)
                                                    .disabled(true)
                                                    .padding(.top, 8)
                                                
                                                Button(action: { children.removeAll(where: { $0 == child.id }) }) {
                                                    Image(systemName: "xmark.circle")
                                                        .foregroundColor(.secondary)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 64)
                }
            }
            
            Button(action: done) {
                Text("Готово")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .foregroundColor((name.isEmpty || surname.isEmpty) ? .white : .blue)
                    .background(.ultraThickMaterial)
                    .cornerRadius(10)
            }
            .disabled(name.isEmpty || surname.isEmpty)
        }
        .padding()
        .onAppear(perform: setup)
    }
    
    private func setup() {
        guard let person = model.selectedPerson else { return }
        
        name = person.name
        patronymic = person.patronymic
        surname = person.surname
        birthDate = person.birthDate
        deathDate = person.deathDate
        hometown = person.hometown
        avatarLink = person.avatarLink
        occupation = person.occupation
        parents = person.parents
        children = person.children
    }
    
    private func done() {
        guard let personID = model.selectedPerson?.id else { return }
        
        model.updatePerson(
            .init(
                id: personID,
                name: name,
                patronymic: patronymic,
                surname: surname,
                birthDate: birthDate,
                deathDate: deathDate,
                hometown: hometown,
                occupation: occupation,
                avatarLink: avatarLink,
                parents: parents,
                children: children
            )
        )
    }
}

struct NewPersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonEditView(model: MainViewModel())
            .preferredColorScheme(.light)
            
    }
}
