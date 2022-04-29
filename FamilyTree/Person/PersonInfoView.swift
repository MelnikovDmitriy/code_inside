//
//  PersonInfoView.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022.
//

import SwiftUI

struct PersonInfoView: View {
    @ObservedObject var model: MainViewModel
    
    let person: Person
    
    var body: some View {
        HStack(spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Имя")
                Text("Отчество")
                Text("Фамилия")
                
                if person.birthDate != .future {
                    Text("Дата рождения")
                }
                
                if person.deathDate != .future {
                    Text("Дата смерти")
                }
                
                Text("Родной город")
                Text("Профессия")
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(person.name)
                Text(person.patronymic)
                Text(person.surname)
                
                if person.birthDate != .future {
                    Text(person.birthDate, format: Date.FormatStyle().year().month().day())
                }
                
                if person.deathDate != .future {
                    Text(person.deathDate, format: Date.FormatStyle().year().month().day())
                }
                
                Text(person.hometown)
                Text(person.occupation)
            }
            .font(.footnote)
        }
        .padding()
        .frame(width: 300)
    }
}

struct PersonInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonInfoView(
            model: MainViewModel(),
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
            )
        )
    }
}
