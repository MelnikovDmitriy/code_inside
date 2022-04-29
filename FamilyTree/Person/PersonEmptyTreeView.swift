//
//  PersonEmptyTreeView.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022
//

import SwiftUI

struct PersonEmptyTreeView: View {
    @ObservedObject var model: MainViewModel
    
    var body: some View {
        Text("Пока здесь пусто.\nСтоит кого-то добавить\n👶🏻👵🏻🧔🏻‍♂️")
            .multilineTextAlignment(.center)
            .lineSpacing(12)
            .font(.headline)
            .padding()
    }
}

struct AddPersonButton_Previews: PreviewProvider {
    static var previews: some View {
        PersonEmptyTreeView(model: MainViewModel())
    }
}
