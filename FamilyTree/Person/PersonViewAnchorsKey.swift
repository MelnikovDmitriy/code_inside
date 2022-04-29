//
//  PersonViewAnchorsKey.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022.
//

import SwiftUI

struct PersonViewAnchorsKey: PreferenceKey {
    static var defaultValue: [UUID:Anchor<CGPoint>] { [:] }
    
    static func reduce(value: inout [UUID:Anchor<CGPoint>], nextValue: () -> [UUID:Anchor<CGPoint>]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}
