//
//  PersonView.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022
//

import SwiftUI

struct PersonView: View {
    let person: Person
    
    @ObservedObject var model: MainViewModel
    
    var body: some View {
        VStack(alignment: model.selectedPersonInfo?.id == person.id ? .leading : .center) {
            AsyncImage(
                url: URL(string: person.avatarLink) ?? URL(string: "https://"),
                content: { image in
                    image
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                },
                placeholder: {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.blue)
                        .opacity(0.35)
                })
            
            
            if model.selectedPersonInfo?.id == person.id {
                PersonInfoView(model: model, person: person)
                    .transition(
                        AnyTransition.asymmetric(
                            insertion: .scale,
                            removal: .identity
                        )
                    )
                
            } else {
                VStack {
                    Text(person.name + (person.patronymic.isEmpty ? "" : " \(person.patronymic)"))
                    Text(person.surname)
                }
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Colors.primaryText)
                .transition(
                    AnyTransition.asymmetric(
                        insertion: .scale,
                        removal: .identity
                    )
                )
            }
        }
        .padding()
        .background(Colors.primaryBackground)
        .cornerRadius(12)
        .animation(.spring(), value: model.selectedPersonInfo)
        .onTapGesture {
            model.selectedPersonInfo = model.selectedPersonInfo == nil ? person : nil
        }
        .contextMenu {
            Button {
                model.pushEditPersonView(person: person)
            } label: {
                Text("Редактировать")
            }
            
            Button {
                model.addChild(parentID: person.id)
            } label: {
                Text("Добавить ребенка")
            }
            
            Button {
                model.addParent(childID: person.id)
            } label: {
                Text("Добавить родителя")
            }
            
            Button {
                
            } label: {
                Text("Добавить брата или сестру")
            }
            
            Button {
                
            } label: {
                Text("Удалить")
            }
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(
            person: .init(
                id: UUID(),
                name: "Николай",
                patronymic: "Георгиевич",
                surname: "Самойлов",
                birthDate: Date(),
                deathDate: Date.future,
                hometown: "Москва",
                occupation: "Ландшафтный дизайнер",
                avatarLink: "",
                parents: [],
                children: []
            ),
            model: MainViewModel()
        )
    }
}
