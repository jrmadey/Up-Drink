//
//  ContentView.swift
//  UpDrink
//
//  Created by J.R. Madey on 6/10/21.
//

import SwiftUI

// Basic struc for SwiftUI View:
struct ContentView: View {
    
    @AppStorage("waterConsumed") var waterConsumed: Int = 0
    
    var body: some View {

        //Allows elements to be stacked along Z-axis
        ZStack{
            Color("Primary")
            // Allows background color to fill in top and bottom regions on iPhone X+
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
            // Allows view elements to be stacked vertically
            VStack{
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action: {
                        waterConsumed *= 0
                    }, label: {
                        Image(systemName: "minus.circle")
                            .font(Font.system(.headline).bold())
                        
                    })
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button(action: {
                        waterConsumed += 8
                        //call imageSwitch func
                    }, label: {
                        HStack {
                            Text("Water Log:")
                                .font(.headline)
                        Image(systemName: "plus.circle")
                            .font(Font.system(.headline).bold())
                        }
                    })
                    Spacer()
                }
                .padding(15)
              
                Text("UpDrink")
                    .font(.system(size: 34, weight: .semibold, design: .serif))
                
                if waterConsumed <= 24 {
                    Image("desert")
                        .resizable()
                        .frame(width: 300, height: 425, alignment: .center)
                        .clipShape(Circle())
                }
                
                if waterConsumed == 32 {
                    Image("stream")
                        .resizable()
                        .frame(width: 300, height: 425, alignment: .center)
                        .clipShape(Circle())
                }
                
                if waterConsumed == 40 {
                    Image("lake")
                        .resizable()
                        .frame(width: 300, height: 425, alignment: .center)
                        .clipShape(Circle())
                }
                
                if waterConsumed >= 48 {
                    Image("waves")
                        .resizable()
                        .frame(width: 300, height: 425, alignment: .center)
                        .clipShape(Circle())
                }
                
                Text("You have had \(waterConsumed) ounces of water today.")
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                    .multilineTextAlignment(.center)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .frame(width: 300, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Spacer()
                Spacer()
              
                        
                }
                
        }
        // Required here for text on screen to appear white
        .foregroundColor(Color("PrimaryText"))
        // Makes SwiftUI "Back" Button white instead of default blue
        .accentColor(.white)
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ContentView()
        }
        // Causes "Back" arrows to be white instead of blue.
        .accentColor(.white)
            
        //Allows us to monitor both modes simultaneously
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        
    }
   
}
    
