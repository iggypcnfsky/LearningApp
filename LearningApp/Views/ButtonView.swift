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
            Text(buttonText)
                    .foregroundColor(textColor)
                    .padding()
                    .background(buttonColor)
                    .cornerRadius(12)
                .shadow(radius: 10)
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
