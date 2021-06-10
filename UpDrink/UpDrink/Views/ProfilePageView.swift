//
//  ProfilePageView.swift
//  UpDrink
//
//  Created by J.R. Madey on 6/10/21.
//

import SwiftUI

struct ProfilePageView: View {
    
    
    //ProfilePageView():
    var body: some View {
        
        ZStack {
            
            Color("Primary")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 20){
                
                // Where user profile image will go...
                Image("colorful drop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 325, alignment: .center)
                    .clipShape(Circle())
            
        }
        //Cahnges text white
        .foregroundColor(Color("PrimaryText"))
        
}
    }
    
struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
    
}

