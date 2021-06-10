//
//  HistoryPageView.swift
//  UpDrink
//
//  Created by J.R. Madey on 6/10/21.
//

import SwiftUI

import CoreData

struct HistoryPageView: View {
    let coreDataStack: CoreDataStack
    
    @State var ounces = ""
    @State var totalOunces : [WaterHistory] = []
    
    var body: some View {
        ZStack{
            Color("Primary")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Text("How Many Ounces Did You Drink Today?")
                    .font(.headline)
                    .foregroundColor(Color("PrimaryText"))
                
                TextField("Enter # of ounces here", text: $ounces)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                
                Button("Save Ounces") {
                    coreDataStack.saveWaterHistory(named: ounces)
                    totalOunces = coreDataStack.getAllOunces()
                    ounces = ""
                }
                
                List {
                    ForEach(totalOunces) { (waterHistory: WaterHistory) in
                        Text(waterHistory.ounces ?? "")
                    }.onDelete { rows in
                        for row in rows {
                            let waterHistory = totalOunces[row]
                            coreDataStack.deleteOunces(waterHistory)
                        }
                        
                        totalOunces.remove(atOffsets: rows)
                    }
                }.onAppear {
                    totalOunces = coreDataStack.getAllOunces()
                }


            }
            
        }
    }
}

struct HistoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPageView(coreDataStack: CoreDataStack())
    }
}
