//
//  ActivityView.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool

    let activityItems = [URL(string: "https://cdn.pixabay.com/photo/2014/12/22/00/07/tree-576847_1280.png")!]

    func makeUIViewController(context: Context) -> ActivityViewControllerWrapper {
        ActivityViewControllerWrapper(
            isPresented: $isPresented,
            activityItems: activityItems
        )
    }

    func updateUIViewController(_ uiViewController: ActivityViewControllerWrapper, context: Context) {
        uiViewController.isPresented = $isPresented
        uiViewController.activityItems = activityItems
        uiViewController.updateState()
    }
}
