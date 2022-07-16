//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 16/07/2022.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
