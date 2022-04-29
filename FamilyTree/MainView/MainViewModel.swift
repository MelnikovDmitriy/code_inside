//
//  MainViewModel.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var persons = Person.testArray
    @Published var selectedPerson: Person?
    @Published var selectedPersonInfo: Person?
    @Published var personsListAction: PersonsListAction?
    @Published var editingMode = false
    @Published var isBottomMenuPresented = false
    @Published var isActivityViewPresented = false
    
    private(set) lazy var rootPerson: Person? = { persons.first }()
    
    func pushNewPersonView() {
        selectedPerson = .empty
    }
    
    func pushEditPersonView(person: Person) {
        selectedPerson = person
    }
    
    func releaseSelectedPerson() {
        guard selectedPerson != nil else { return }
        selectedPerson = nil
    }
        
    func updatePerson(_ person: Person) {
        if persons.isEmpty {
            rootPerson = person
        }
        
        if let index = persons.firstIndex(where: { $0.id == person.id }) {
            persons[index] = person

        } else {
            persons.append(person)
        }
        
        releaseSelectedPerson()
    }
    
    func removePerson(_ person: Person) {
        persons.removeAll(where: { $0.id == person.id })
        
        if persons.isEmpty {
            rootPerson = nil
        }
    }
    
    func addChild(parentID: UUID) {
        var child = Person.empty
        child.parents = [parentID]
        selectedPerson = child
        
        DispatchQueue.main.async {
            if let index = self.persons.firstIndex(where: { $0.id == parentID }) {
                self.persons[index].children.append(child.id)
            }
        }
    }
    
    func selectChild(parentID: UUID) {
        guard let index = persons.firstIndex(where: { $0.id == parentID }) else { return }
        let parent = persons[index]
        let name = "\(parent.surname) \(parent.name) \(parent.patronymic)"
        
        personsListAction = .init(title: "Выбираем ребенка для:", name: name) { [weak self] child in
            guard let self = self else { return }
            self.persons[index].children.append(child.id)
            self.personsListAction = nil
        }
    }
    
    func findChildren(_ children: [UUID]) -> [Person] {
        children.compactMap { id in
            persons.first(where: { $0.id == id })
        }
    }
    
    func addParent(childID: UUID) {
        var parent = Person.empty
        parent.children = [childID]
        selectedPerson = parent
        
        DispatchQueue.main.async {
            if let index = self.persons.firstIndex(where: { $0.id == childID }) {
                self.persons[index].parents.append(parent.id)
            }
        }
    }
    
    func selectParent(childID: UUID) {
        guard let index = persons.firstIndex(where: { $0.id == childID }) else { return }
        let child = persons[index]
        let name = "\(child.surname) \(child.name) \(child.patronymic)"
        
        personsListAction = .init(title: "Выбираем родителя для:", name: name) { [weak self] parent in
            guard let self = self else { return }
            self.persons[index].parents.append(parent.id)
            self.personsListAction = nil
        }
    }
    
    func findParents(_ parents: [UUID]) -> [Person] {
        parents.compactMap { id in
            persons.first(where: { $0.id == id })
        }
    }
}
