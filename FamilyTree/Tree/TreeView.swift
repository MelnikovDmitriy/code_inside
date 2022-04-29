//
//  TreeView.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022
//

import SwiftUI

struct TreeView<Content>: View where Content: View {
    @ObservedObject var model: MainViewModel
   
    let direction: TreeDirection
    let person: Person
    let content: (Person) -> Content
        
    var body: some View {
        VStack(spacing: 16) {
            if direction == .root || direction == .up {
                HStack(alignment: .bottom, spacing: 24) {
                    ForEach(model.findParents(person.parents)) { parent in
                        TreeView(model: model, direction: .up, person: parent, content: content)
                    }
                }
            }
            
            content(person)
                .anchorPreference(
                    key: PersonViewAnchorsKey.self,
                    value: .center,
                    transform: { [person.id: $0] }
                )
            
            if direction == .root || direction == .down {
                HStack(alignment: .top, spacing: 24) {
                    ForEach(model.findChildren(person.children)) { child in
                        TreeView(model: model, direction: .down, person: child, content: content)
                    }
                }
            }
        }
        .backgroundPreferenceValue(PersonViewAnchorsKey.self) { centers in
            GeometryReader { proxy in
                ForEach(person.children, id: \.self) { child in
                    if let parentCenter = centers[person.id],
                       let childCenter = centers[child] {
                        TreeLineShape(startPoint:  proxy[parentCenter], endPoint: proxy[childCenter])
                            .stroke()
                    }
                }
                
                ForEach(person.parents, id: \.self) { parent in
                    if let childCenter = centers[person.id],
                       let parentCenter = centers[parent] {
                        TreeLineShape(startPoint: proxy[childCenter], endPoint: proxy[parentCenter])
                            .stroke()
                    }
                }
            }
        }
    }
}

struct TreeView_Previews: PreviewProvider {
    static let model = MainViewModel()
    
    static var previews: some View {
        ScrollView([.horizontal, .vertical]) {
            TreeView(
                model: model,
                direction: .root,
                person: .empty,
                content: { person in
                    PersonView(person: person, model: model)
                }
            )
        }
    }
}
