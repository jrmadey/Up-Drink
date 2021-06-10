//
//  SettingsPageView.swift
//  UpDrink
//
//  Created by J.R. Madey on 6/10/21.
//

import SwiftUI

struct SettingsPageView: View {
    
    var body: some View {
        ZStack {
            
            Color("Primary")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            // Organizes buttons in column
            VStack{
                
                // Each sapcer provides as much space between defined objects or borders
                Spacer()
                
                //Why Hydrate? Button:
                //Will eventually link to page with health information re: importance of staying hydrated
                Button(action: {
                    print("Why Hydrate Clicked")
                }, label: {
                    HStack{
                        Text("Why Hydrate?")
                            .font(.headline)
                    
                        Image(systemName: "cloud.heavyrain")
                            .font(Font.system(.headline).bold())
                        
                    }
                })
                    .padding()
                    .background(Color("PrimaryButton"))
                    .cornerRadius(8)
            
                Spacer()
    
                //Apple Health Button:
                //Will evnetually allow users to link data to Apple Health
                Button(action: {
                    print("Apple Health Clicked")
                }, label: {
                    HStack{
                        Text("Apple Health")
                            .font(.headline)
                        
                        Image(systemName: "waveform.path.ecg")
                            .font(Font.system(.headline).bold())
                        
                    }
                })
                
                .padding()
                .background(Color("PrimaryButton"))
                .cornerRadius(8)
                
                Spacer()
                
            }
            .foregroundColor(Color("PrimaryText"))

}
    }

struct MenuPageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPageView()
    }
}
}
        
