//
//  DatePicker+extension.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022.
//

import SwiftUI

extension DatePicker {
    @ViewBuilder func textColor(_ color: Color) -> some View {
        if UITraitCollection.current.userInterfaceStyle == .light {
            self.colorInvert().colorMultiply(color)
        
        } else {
            self.colorMultiply(color)
        }
    }
}
