//
//  PersonsListAction.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022
//

import Foundation

struct PersonsListAction {
    let title: String
    let name: String
    let select: (Person) -> Void
}
