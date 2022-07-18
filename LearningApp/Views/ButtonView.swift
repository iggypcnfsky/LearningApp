//
//  ButtonView.swift
//  LearningApp
//
//  Created by Iggy Pacanowski on 18/07/2022.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonText:String
    var buttonColor:Color
    var textColor:Color
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(buttonColor)
                .frame(height: 48)
                
                .cornerRadius(12)
            
            Text(buttonText)
                .foregroundColor(textColor)
                .bold()
            
        }
        
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "Test", buttonColor: Color.green, textColor: Color.white)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
