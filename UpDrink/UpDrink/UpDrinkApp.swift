//
//  UpDrinkApp.swift
//  UpDrink
//
//  Created by J.R. Madey on 6/10/21.
//

import SwiftUI

@main
struct UpDrinkApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                TabViewMain()
                HistoryPageView(coreDataStack: CoreDataStack())
            }
            //Ensures elements such as "Back" button appear white to user
            .accentColor(.white)
        }
    }
}
