//
//  TabViewMain.swift
//  UpDrink
//
//  Created by J.R. Madey on 6/10/21.
//

import SwiftUI
import CoreData

struct TabViewMain: View {
    
    @State var selected: Int = 3
    
    var body: some View {
        
        TabView(selection: $selected) {
            
            SettingsPageView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(1)
            
            ProfilePageView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(2)
            
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(3)
            
            HistoryPageView(coreDataStack: CoreDataStack())
                .tabItem {
                    Image(systemName: "calendar")
                    Text("History")
                }.tag(4)
            
        }
        .accentColor(.white)
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewMain()
        
    }
}
